class HomeController < ApplicationController

	def index
	end

  	def login

		@aluno = Aluno.new

	end

	def log

		@aluno = Aluno.find_by(params[:matricula])
		senha = params[:senha]
		
		if @aluno.senha.eql? senha

	  		redirect_to :root

  		else

  			redirect_to :login, notice: "Senha ou matrícula incorreta|
  			#{params[:matricula]}|#{@aluno.matricula}|#{senha}|
  			#{@aluno.senha}}"

  		end

	end

end
