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

			aluno = Aluno.find(params[:nota][:aluno_id])
			avaliacao = Avaliacao.find(params[:nota][:avaliacao_id])

			@nota = Nota.new params.require(:nota).permit(:nota)
			@nota.aluno = aluno
			@nota.avaliacao = avaliacao
			
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