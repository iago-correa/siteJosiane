# encoding: UTF-8

class AlunosController < ApplicationController

	def new
	  @aluno = Aluno.new
	end

	def create
		
		@aluno = Aluno.new params.require(:aluno).permit(:nome, :matricula, :senha, :email)
		senha2 = params[:senha2]
		
		if @aluno.senha.eql? senha2

	  		@aluno.confirmado = false
	  		
	  		if @aluno.save
	  			redirect_to action: "new"
	  		else
	  			render :new
	  		end

  		else

  			@msg = "Senhas não verificam"
  			render :new

  		end

	end

	def login

		@aluno = Aluno.new

	end

	def log
	end

end

