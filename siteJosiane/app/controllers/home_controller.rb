# encoding: UTF-8

class HomeController < ApplicationController

	def index
	end

  	def login

		@aluno = Aluno.new

	end

	def log
		
		@aluno = Aluno.find_by_matricula_and_senha(params[:matricula],Digest::MD5.hexdigest(params[:senha]))	
		
		if !@aluno.nil?
			if @aluno.confirmado
			  	redirect_to @aluno
		  	else
		  		redirect_to :login, notice: "Ainda em espera de aprovação de cadastro"
		  	end
		else
			redirect_to :login, notice: 'Matrícula ou senha incorretas'
		end

	end

end
