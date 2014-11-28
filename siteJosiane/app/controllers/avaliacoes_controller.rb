# encoding: UTF-8

class AvaliacoesController < ApplicationController

	def new
		if session[:prof]
			professor = Professor.find_by(siape: session[:prof])
			@turmas = Turma.where("professor_id=#{professor.id}").order(:codigo)
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

	def destroy

        @avaliacao = Avaliacao.find(params[:id])
		professor = Professor.find_by(siape: "#{session[:prof]}")
		if session[:prof]

        	if @avaliacao.destroy
        		redirect_to professores_path, notice: "Avaliação foi excluída"
        	else
        		redirect_to professores_path, notice: "Falha na exclusão da avaliação"
        	end 

        else

			redirect_to :logar

		end

    end

    def show

		if session[:usuario] || session[:prof]
			@avaliacao = Avaliacao.find(params[:id])
			session[:avaliacao]=params[:id]
		else
			redirect_to root_path
		end

	end

end