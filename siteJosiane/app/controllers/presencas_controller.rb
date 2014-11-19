# encoding: UTF-8

class PresencasController < ApplicationController

	def index
		@presenca = Presenca.all
	end

	def new
		@presenca = Presenca.new
	end

	def create
		
		if session[:prof]

			@presenca = Presenca.new params.require(:presenca).permit(:presente, :justificado)

			aluno = Aluno.find_by(matricula: :aluno_id)
			@aid = aluno.id

			disciplina = Disciplina.find_by(nome: :disciplina_id)
			@did = disciplina.id

			@presenca.aluno_id = @aid
			@presenca.disciplina_id = @did
			
			if @presenca.save
				redirect_to professores_path
			else		
				message = "Falha na inserção: "
				@presenca.errors.full_messages.each do |m|
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