# encoding: UTF-8

class AvaliacoesController < ApplicationController

	def new
		if session[:prof]
			@avaliacao = Avaliacao.new
		else
			redirect_to :logar
		end
	end

	def create
		
		if session[:prof]

			turma = Turma.find(params[:avaliacao][:turma_id])
			@avaliacao = Avaliacao.new params.require(:avaliacao).permit(:codigo, :descricao, :maxima, :peso)
			@avaliacao.turma = turma
			if @avaliacao.save
				redirect_to professores_path
			else		
				message = "Falha na inserção: "
				@avaliacao.errors.full_messages.each do |m|
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