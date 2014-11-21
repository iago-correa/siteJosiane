# encoding: UTF-8

class DisciplinasController < ApplicationController


	def new
		if session[:prof]
			@disciplina = Disciplina.new
		else
			redirect_to :logar
		end
	end

	def create
		
		if session[:prof]

			professor = Professor.find_by(siape: "#{session[:prof]}")
			@profid = professor.id

			@disciplina = Disciplina.new params.require(:disciplina).permit(:nome, :chs, :cht)
			@disciplina.professor_id = @profid
			
			if @disciplina.save
				redirect_to professores_path
			else		
				message = "Falha na inserção: "
				@disciplina.errors.full_messages.each do |m|
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