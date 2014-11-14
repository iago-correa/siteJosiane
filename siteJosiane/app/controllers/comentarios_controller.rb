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
				redirect_to @post, notice: "Comentário realizado"
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

        @aluno = Aluno.find(params[:id])
        if @aluno.destroy
        	redirect_to :alunos, notice: "Aluno #{@aluno.nome} foi excluído"
        else
        	redirect_to :alunos, notice: "Falha na exclusão do aluno #{@aluno.nome}"
        end
        
    end

end
