# encoding: UTF-8

class ArquivosController < ApplicationController

	def new
		if session[:prof]
			@arquivo = Arquivo.new
		else
			redirect_to :logar
		end
	end

	def create
		
		if session[:prof]

			@arquivo = Arquivo.new params.require(:arquivo).permit(:nome, :extensao)
			
			if @arquivo.save
				redirect_to professores_path
			else		
				message = "Falha na inserção: "
				@arquivo.errors.full_messages.each do |m|
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