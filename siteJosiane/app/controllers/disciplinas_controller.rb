# encoding: UTF-8

class DisciplinasController < ApplicationController

	def index
		@disciplina = Disciplina.all
	end

	def new

		@disciplina = Disciplina.new

	end

	def create
			
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

end