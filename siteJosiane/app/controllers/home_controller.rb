# encoding: UTF-8

class HomeController < ApplicationController

	def index
		@posts = Post.all.limit(4)
	end

  	def login

  		if not session[:usuario]
			@aluno = Aluno.new
		else
			redirect_to root_path
		end

	end

	def log
		
		if not session[:usuario]

		@aluno = Aluno.find_by_matricula_and_senha(params[:matricula],Digest::MD5.hexdigest(params[:senha]))
		
			if !@aluno.nil?
				if @aluno.confirmado
					session[:usuario] = @aluno.matricula
					redirect_to :home
			  	else
			  		flash.now[:alert] = "Ainda em espera de aprovação de cadastro"
	        		render :login
			  	end
			else
				@aluno = Aluno.new
				flash.now[:alert] = 'Matrícula ou senha incorretas'
	        	render :login
			end

		else

			redirect_to root_path

		end

	end

	def logout

		if session[:usuario]
		    reset_session
		    redirect_to root_path
		else
			redirect_to action: 'login'
		end

  	end

end
