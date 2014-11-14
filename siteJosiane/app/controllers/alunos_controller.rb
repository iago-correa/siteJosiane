# encoding: UTF-8

class AlunosController < ApplicationController

	def index
		if session[:prof]
			@turmas = Turma.all
			if session[:turma]
				if session[:turma]!="0"
					@turma = Turma.find_by_codigo(session[:turma])
					@alunos = Aluno.where(turma_id: @turma.id).order('nome')
				else
					@alunos = Aluno.all
				end
			else
				@alunos = Aluno.all
			
			end
		else
			redirect_to professores_path
	  	end
	end

	def alunos_turma

		session[:turma] = params[:turma]
		redirect_to alunos_path
		
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

				    flash.now[:alert] = message
	        		render 'new'

		  		end

	  		else

	  			flash.now[:alert] = "Senhas não verificam"
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

		  		flash.now[:alert] = message
		  		render :edit
	            
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

        @aluno = Aluno.find(params[:id])
        if session[:usuario] && @aluno.matricula==session[:usuario]
	        
	        if @aluno.destroy
	        	reset_session
		    	redirect_to root_path, notice: "Conta de usuário deletada"
	        else
	        	redirect_to :alunos, notice: "Falha na exclusão de conta"
	        end

    	else

			redirect_to root_path

    	end
        
    end

	def aprovar

		if session[:prof]
		
			@aluno = Aluno.find(params[:id])
			if @aluno.update(confirmado: true)
		  		redirect_to :alunos, notice: "Aluno #{@aluno.nome} teve cadastro confirmado"
		  	else
		  		redirect_to :alunos, notice: "Falha na confirmação do cadastro do aluno #{@aluno.nome}"
		  	end
	  	
	  	else

			redirect_to professores_path

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
		  			flash.now[:alert] = "Falha na troca de senha"
		  			render :nova_senha
		  		end

	  		else

	  			flash.now[:alert] = "Senha antiga incorreta"
	  			render :nova_senha

	  		end

	  	else
			redirect_to root_path
	    end

	end

end

