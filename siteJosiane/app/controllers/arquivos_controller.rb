# encoding: UTF-8

class ArquivosController < ApplicationController

	def index
		@arquivo = Arquivo.all
	end

	def new
		@arquivo = Arquivo.new
	end

	def create
			
		@arquivo = Arquivo.new params.require(:arquivo).permit(:conteudo, :nome, :tipo, :extensao)
			
		if @arquivo.save
			redirect_to professores_path, notice: "Arquivo inserido!"
		else		
			message = "Falha na inserção: "
			@arquivo.errors.full_messages.each do |m|
				message += m
			end

			flash.now[:alert] = message
	    	render 'new'
  		end
 
	end

end