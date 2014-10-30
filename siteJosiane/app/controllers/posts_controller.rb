# encoding: UTF-8

class PostsController < ApplicationController

	def index
		@post = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		
		@data = Time.now	
		@profid = Professor.first
		@post = Post.new params.require(:post).permit(:conteudo, :tipo)
		@post.data = @data
		@post.professor_id = @profid
			
		if @disciplina.save
			redirect_to professores_path, notice: "Disciplina inserida!"
		else		
			message = "Falha na inserção: "
			@disciplina.errors.full_messages.each do |m|
				message += m
			end

			flash.now[:alert] = message
	    	render 'new'
  		end
 
	end

end