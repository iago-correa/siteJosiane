# encoding: UTF-8

class ProfessorController < ApplicationController

	def disciplina
			
		@disciplina = Aluno.new params.require(:nome).permit(:nome, :chs, :cht, :profid)
			
		if @disciplina.save
			redirect_to @disciplina, notice: "Disciplina inserida!"
		else
		  			
		message = "Falha na inserção: "

		@disciplina.errors.full_messages.each do |m|
			message += m
		end

		flash[:alert] = message
	    	render 'new'
  		end

	end

	def atendimento

		

	end

	def arquivo



	end

	def nota



	end

	def presenca



	end

end
