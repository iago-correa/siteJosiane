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

			aluno = Aluno.find_by(matricula: "#{session[:prof]}")
			@aid = aluno.id

			disciplina = Disciplina.find_by(nome: "#{session[:prof]}")
			@did = disciplina.id

			@presenca = Presenca.new params.require(:disciplina).permit(:data, :presente, :justificado)
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