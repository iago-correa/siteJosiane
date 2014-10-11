# encoding: UTF-8

class AlunosController < ApplicationController

	def index
		@alunos = Aluno.all
	end

	def new
		if not session[:usuario]
			@aluno = Aluno.new
		else
			redirect_to root_path
		end
	end

	def create
		
		if not session[:usuario]
			
			@aluno = Aluno.new params.require(:aluno).permit(:nome, :matricula, :senha, :email, :turma_id)
			senha2 = params[:senha2]
			
			if @aluno.senha.eql? senha2

		  		@aluno.confirmado = false
		  		@aluno.senha = Digest::MD5.hexdigest(@aluno.senha)
		  		
		  		if @aluno.save
		  			redirect_to @aluno, notice: "Bem vindo(a) #{@aluno.nome}!"
		  		else
		  			
		  			message = "Falha no cadastro: "

		  			@aluno.errors.full_messages.each do |m|
						message += m
				    end

				    flash[:alert] = message
	        		render 'new'

		  		end

	  		else

	  			flash[:alert] = "Senhas não verificam"
	        	render 'new'

	  		end

	  	else
			redirect_to root_path
		end

	end

	def edit

		@aluno = Aluno.find(params[:id])
		if not session[:usuario] && @aluno.matricula==session[:usuario]
			redirect_to root_path
		end

	end

	def update

		@aluno = Aluno.find(params[:id])
		if session[:usuario] && @aluno.matricula==session[:usuario]
		
			if @aluno.update(params.require(:aluno).permit(:nome, :matricula, :email, :turma_id))
	            redirect_to @aluno, notice: "Alterações efetivadas com sucesso"
	        else

	        	message = "Falha nas alterações: "

		  		@aluno.errors.full_messages.each do |m|
					message += m
				   end

		  		redirect_to edit_aluno_path, notice: message
	            
	        end

	    else
			redirect_to root_path
	    end

	end

	def show

		@aluno = Aluno.find(params[:id])
		if not session[:usuario] && @aluno.matricula==session[:usuario]
			redirect_to root_path
		end

	end

	def destroy

		#Como so o professor deleta o aluno, necessario
		#verificar login desse
        @aluno = Aluno.find(params[:id])
        if @aluno.destroy
        	redirect_to :alunos, notice: "Aluno #{@aluno.nome} foi excluído"
        else
        	redirect_to :alunos, notice: "Falha na exclusão do aluno #{@aluno.nome}"
        end
        

    end

	def aprovar

		#Como so o professor aprova o cadastro do aluno
		#necessario verificar login desse
		@aluno = Aluno.find(params[:id])

		if @aluno.update(confirmado: true)
	  		redirect_to :alunos, notice: "Aluno #{@aluno.nome} teve cadastro confirmado"
	  	else
	  		redirect_to :alunos, notice: "Falha na confirmação do cadastro do aluno #{@aluno.nome}"
	  	end

	end

	def nova_senha

		@aluno = Aluno.find(params[:id])
		if not session[:usuario] && @aluno.matricula==session[:usuario]
			redirect_to root_path
		end

	end

	def troca_senha

		@aluno = Aluno.find(params[:id])
		if session[:usuario] && @aluno.matricula==session[:usuario]
			old_senha = Digest::MD5.hexdigest(params[:senha_antiga])

			if @aluno.senha.eql? old_senha
		  		
				new_senha = Digest::MD5.hexdigest(params[:senha])

		  		if @aluno.update(senha: new_senha)
		  			redirect_to @aluno, notice: "Troca de senha efetuada com sucesso"
		  		else
		  			redirect_to :nova_senha, notice: "Falha na troca de senha"
		  		end

	  		else

	  			redirect_to :nova_senha, notice: "Senha antiga incorreta"

	  		end

	  	else
			redirect_to root_path
	    end

	end

end

