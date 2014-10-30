# encoding: UTF-8

class DisciplinasController < ApplicationController

	def index
		@disciplina = Disciplina.all
	end

	def new
		@disciplina = Disciplina.new
	end

	def create
		
		if session[:prof]

			

			@prof = Professor.first
			@disciplina = Disciplina.new params.require(:disciplina).permit(:nome, :chs, :cht)
			@disciplina.professor = @prof
			
			if @disciplina.save
				redirect_to professores_path, notice: "Disciplina inserida!"
			else		
				message = "Falha na inserção: "
				@disciplina.errors.full_messages.each do |m|
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