# encoding: UTF-8

class AtendimentosController < ApplicationController

	def index
		@atendimento = Atendimento.all
	end

	def new
		@atendimento = Atendimento.new
	end

	def create
		
		if session[:prof]

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

				flash.now[:alert] = message
	    		render 'new'
  			end

  		else
			redirect_to :logar
	   	end
 
	end

end