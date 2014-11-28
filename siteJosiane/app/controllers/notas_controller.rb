# encoding: UTF-8

class NotasController < ApplicationController

	def usuario
		if session[:usuario]
			aluno = Aluno.find_by_matricula(session[:usuario])
			turma = Turma.find(aluno.turma_id)
			@professor = Professor.find(turma.professor_id)
			@avaliacoes = Avaliacao.select('id, descricao, maxima, peso').where("turma_id=#{aluno.turma_id}")
			@notas = Nota.select('nota, avaliacao_id, aluno_id').where("aluno_id = #{aluno.id}")
		else
			redirect_to root_path
		end
	end

	def new
		if session[:prof]
			@professor = Professor.find_by(siape: session[:prof])
			@avaliacoes = Avaliacao.joins('JOIN turmas ON turmas.id = avaliacoes.turma_id').where("professor_id=#{@professor.id}")
			@alunos = Aluno.joins('JOIN turmas ON turmas.id = alunos.turma_id').where("professor_id=#{@professor.id}")
			@nota = Nota.new
		else
			redirect_to :logar
		end
	end

	def create
		
		if session[:prof]

			aluno = Aluno.find(params[:nota][:aluno_id])
			avaliacao = Avaliacao.find(params[:nota][:avaliacao_id])

			@nota = Nota.new params.require(:nota).permit(:nota)
			@nota.aluno = aluno
			@nota.avaliacao = avaliacao
			
			if @nota.save
				redirect_to professores_path
			else		
				message = "Falha na inserção: "
				@nota.errors.full_messages.each do |m|
					message += m
				end

				flash.now[:alert] = message
	    		render 'new'
  			end

  		else
			redirect_to :logar
	   	end
 
	end

end