# encoding: UTF-8

class AtendimentosController < ApplicationController

	def index
		@atendimento = Atendimento.all
	end

	def new
		@atendimento = Atendimento.new
	end

	def create
		
		@prof = Professor.first
		@atendimento = Atendimento.new params.require(:atendimento).permit(:hora_inicio, :hora_fim, :dia)
		@atendimento.professor = @prof
			
		if @atendimento.save
			redirect_to professores_path, notice: "Atendimento inserido!"
		else		
			message = "Falha na inserção: "
			@atendimento.errors.full_messages.each do |m|
				message += m
			end

			flash[:alert] = message
	    	render 'new'
  		end
 
	end

end