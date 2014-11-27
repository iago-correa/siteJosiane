# encoding: UTF-8

class NotasController < ApplicationController

	def usuario
		if session[:usuario]
			@avaliacoes = Avaliacao.select('id, descricao, maxima, peso')
			@aluno = Aluno.find_by_matricula(session[:usuario])
			@notas = Nota.select('nota, avaliacao_id, aluno_id').where("aluno_id = #{@aluno.id}")
		else
			redirect_to root_path
		end
	end

	def new
		if session[:prof]
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