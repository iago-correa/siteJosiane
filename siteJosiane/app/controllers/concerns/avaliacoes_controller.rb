# encoding: UTF-8

class AvaliacoesController < ApplicationController

	def index
		@avaliacao = Avaliacao.all
	end

	def new
		@avaliacao = Avaliacao.new
	end

	def create
		
		if session[:prof]

			disciplina = Disciplina.find_by(nome: :disciplina_id)
			@did = disciplina.id

			@avaliacao = Avaliacao.new params.require(:avaliacao).permit(:desc, :peso, :maxima)
			@avaliacao.disciplina_id = @did
			
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