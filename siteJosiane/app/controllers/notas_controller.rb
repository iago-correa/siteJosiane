# encoding: UTF-8

class NotasController < ApplicationController

	def index
		@nota = Nota.all
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

			@nota = Nota.new params.require(:nota).permit(:nota, :aluno, :avaliacao)
			@nota.aluno_id = 
			@nota.avaliacao_id = 
			
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