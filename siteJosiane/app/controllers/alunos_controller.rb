# encoding: UTF-8

class AlunosController < ApplicationController

	def index
		@alunos = Aluno.all
	end

	def new
		@aluno = Aluno.new
	end

	def create
		
		@aluno = Aluno.new params.require(:aluno).permit(:nome, :matricula, :senha, :email, :turma_id)
		senha2 = params[:senha2]
		
		if @aluno.senha.eql? senha2

	  		@aluno.confirmado = false
	  		
	  		if @aluno.save
	  			redirect_to @aluno, notice: "Bem vindo #{@aluno.nome}!"
	  		else
	  			
	  			message = "Falha no cadastro: "

	  			@aluno.errors.full_messages.each do |m|
					message += m
			    end

	  			redirect_to new_aluno_path, notice: message

	  		end

  		else

  			redirect_to new_aluno_path, notice: "Senhas não verificam"

  		end

	end

	def edit

		@aluno = Aluno.find(params[:id])

	end

	def update

		@aluno = Aluno.find(params[:id])
		
		if @aluno.update(params.require(:aluno).permit(:nome, :matricula, :email, :turma_id))
            redirect_to @aluno, notice: "Alterações efetivadas com sucesso"
        else

        	message = "Falha nas alterações: "

	  		@aluno.errors.full_messages.each do |m|
				message += m
			   end

	  		redirect_to edit_aluno_path, notice: message
            
        end

	end

	def show

		@aluno = Aluno.find(params[:id])

	end

	def destroy

        @aluno = Aluno.find(params[:id])
        if @aluno.destroy
        	redirect_to :alunos, notice: "Aluno #{@aluno.nome} foi excluído"
        else
        	redirect_to :alunos, notice: "Falha na exclusão do aluno #{@aluno.nome}"
        end
        

    end

	def aprovar

		@aluno = Aluno.find(params[:id])

		if @aluno.update(confirmado: true)
	  		redirect_to :alunos, notice: "Aluno #{@aluno.nome} teve cadastro confirmado"
	  	else
	  		redirect_to :alunos, notice: "Falha na confirmação do cadastro do aluno #{@aluno.nome}"
	  	end

	end

	def nova_senha

		@aluno = Aluno.find(params[:id])

	end

	def troca_senha

		@aluno = Aluno.find(params[:id])
		old_senha = params[:senha_antiga]
		
		if @aluno.senha.eql? old_senha
	  		
			new_senha = params[:senha]

	  		if @aluno.update(senha: new_senha)
	  			redirect_to @aluno, notice: "Troca de senha efetuada com sucesso"
	  		else
	  			redirect_to :nova_senha, notice: "Falha na troca de senha"
	  		end

  		else

  			redirect_to :nova_senha, notice: "Senha antiga incorreta"

  		end


	end

end

