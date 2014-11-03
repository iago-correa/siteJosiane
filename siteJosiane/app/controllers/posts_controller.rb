# encoding: UTF-8

class PostsController < ApplicationController

	def new
		if session[:prof]
		
			@post = Post.new

		else

			redirect_to :logar
			
		end
	end

	def create
		
		if session[:prof]

			professor = Professor.find_by(siape: "#{session[:prof]}")
			@profid = professor.id

			@post = Post.new params.require(:post).permit(:conteudo, :tipo)

			@post.professor_id = @profid
			
			if @post.save
				redirect_to professores_path
			else		
				message = "Falha na inserção: "
				@post.errors.full_messages.each do |m|
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