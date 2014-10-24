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
		@post = Post.new params.require(:post).permit(:conteudo, :tipo, @data, :profid)
			
		if @disciplina.save
			redirect_to @disciplina, notice: "Disciplina inserida!"
		else		
			message = "Falha na inserção: "
			@disciplina.errors.full_messages.each do |m|
				message += m
			end

			flash[:alert] = message
	    	render 'new'
  		end
 
	end

end