# encoding: UTF-8

class HomeController < ApplicationController

	def index
	end

  	def login

		@aluno = Aluno.new

	end

	def log

		@aluno = Aluno.find_by(matricula: params[:matricula])
		senha = params[:senha]
		
		if @aluno.confirmado
			if @aluno.senha.eql? senha 
		  		redirect_to @aluno
	  		else
	  			redirect_to :login, notice: "Senha ou matrícula incorreta"
	  		end
	  	else
	  		redirect_to :login, notice: "Ainda em espera de aprovação de cadastro"
	  	end

	end

end
