# encoding: UTF-8

class TurmasController < ApplicationController

	def index
		@turma = Turma.all
	end

	def new
		@turma = Turma.new
	end

	def create
			
		@turma = Turma.new params.require(:turma).permit(:codigo)
			
		if @turma.save
			redirect_to professores_path, notice: "Turma inserida!"
		else		
			message = "Falha na inserção: "
			@turma.errors.full_messages.each do |m|
				message += m
			end

			flash[:alert] = message
	    	render 'new'
  		end
 
	end

end