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

			@post = Post.new params.require(:post).permit(:titulo, :conteudo, :tipo)

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

	def edit
		@post = Post.find(params[:id])
		@arquivo = Arquivo.new
		if not session[:prof]
			redirect_to root_path
		end
	end

	def update

		@post = Post.find(params[:id])
		if session[:prof] && @professor.siape==session[:prof]
		
			if @post.update(params.require(:post).permit(:conteudo, :tipo))
	            redirect_to professores_path, notice: "Alterações efetivadas com sucesso"
	        else

	        	message = "Falha nas alterações: "

		  		@post.errors.full_messages.each do |m|
					message += m
				   end

		  		flash.now[:alert] = message
		  		render :edit
	            
	        end

	    else
			redirect_to :logar
	    end

	end

	def show

		if session[:usuario] || session[:prof]
			@post = Post.find(params[:id])
			@coments = Comentario.where(post_id: params[:id]).order('created_at')
			session[:post]=params[:id]
		else
			redirect_to root_path
		end

	end

	def destroy

        @post = Post.find(params[:id])

        if session[:prof] && @professor.siape==session[:prof]

        	if @post.destroy
        		redirect_to professores_path, notice: "Post foi excluído"
        	else
        		redirect_to professores_path, notice: "Falha na exclusão do post"
        	end 

        else

			redirect_to :logar

		end

    end

end