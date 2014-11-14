# encoding: UTF-8

class ComentariosController < ApplicationController

	def new
		if session[:usuario]
			@comentario = Comentario.new
		else
			redirect_to root_path
		end
	end

	def create
		
		if session[:usuario]
			
			usuario = Aluno.find_by_matricula(session[:usuario])
			post = Post.find(session[:post])

			@comentario = Comentario.new params.require(:comentario).permit(:conteudo)
			@comentario.post_id = post.id
			@comentario.aluno_id = usuario.id

			if @comentario.save
				redirect_to post, notice: "Comentário realizado"
			else		
				message = "Falha no comentário: "
				@comentario.errors.full_messages.each do |m|
					message += m
				end

				flash.now[:alert] = message
	    		render 'new'
  			end

	  	else

			redirect_to root_path

		end

	end

	def destroy

        @comentario = Comentario.find(params[:id])
        post = Post.find(session[:post])
        usuario = Aluno.find_by_matricula(session[:usuario])

        if session[:usuario] && @comentario.aluno_id==usuario.id
	        
	        if @comentario.destroy
	        	redirect_to post, notice: "Comentário removido"
	        else
	        	redirect_to post, notice: "Falha na exclusão do comentario"
	        end

    	else

			redirect_to root_path

    	end
        
    end

end