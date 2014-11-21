# encoding: UTF-8

class AtendimentosController < ApplicationController


	def new
		if session[:prof]
			@atendimento = Atendimento.new
		else
			redirect_to :logar
		end
	end

	def create
		
		if session[:prof]

			professor = Professor.find_by(siape: "#{session[:prof]}")
			@profid = professor.id

			@atendimento = Atendimento.new params.require(:atendimento).permit(:hora_inicio, :hora_fim, :dia)
			@atendimento.professor_id = @profid
			
			if @atendimento.save
				redirect_to professores_path
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