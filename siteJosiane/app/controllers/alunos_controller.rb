# encoding: UTF-8

class AlunosController < ApplicationController

	def new
	  @aluno = Aluno.new
	end

	def create
		
		@aluno = Aluno.new params.require(:aluno).permit(:nome, :matricula, :senha, :email, :turma_id)
		senha2 = params[:senha2]
		
		if @aluno.senha.eql? senha2

	  		@aluno.confirmado = false
	  		
	  		if @aluno.save
	  			redirect_to @aluno
	  		else
	  			render :new
	  		end

  		else

  			@msg = "Senhas não verificam"
  			render :new

  		end

	end

	def edit

		@aluno = Aluno.find(params[:id])

	end

	def update

		@aluno = Aluno.find(params[:id])
		
		if @aluno.update(params.require(:aluno).permit(:nome, :matricula, :email, :turma_id))
            redirect_to @aluno
        else
            render :edit
        end

	end

	def show

		@aluno = Aluno.find(params[:id])

	end

	def nova_senha

		@aluno = Aluno.find(params[:id])

	end

	def troca_senha

		@aluno = Aluno.find(params[:id])
		
		if @aluno.senha.eql? params[:senha_antiga]
	  		
	  		if @aluno.update(params.require(:aluno).permit(:senha))
	  			#redirect_to @aluno
	  			render :index
	  		else
	  			render :nova_senha
	  		end

  		else

  			@msg = "Senhas não verificam"
  			render :nova_senha

  		end


	end

end

