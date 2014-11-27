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

			@post = Post.new params.require(:post).permit(:titulo, :conteudo)

			@post.professor_id = @profid

			@post.tipo = params['tipo']
			
			if @post.save

				if not params['arquivo'].blank?

					name =  params['arquivo'].original_filename

					parts = name.partition(".")

					extensao = parts.last

					nome = name.delete("."+extensao)

					file_name = Digest::MD5.hexdigest(nome)

    				path = File.join(Rails.root, "public/uploads", file_name+"."+extensao)

    				File.open(path, "wb") do |f| 
  						f.write(params['arquivo'].read)
					end

					arquivo = Arquivo.new

					arquivo.nome = params['nome_arquivo']

					arquivo.arquivo_nome = file_name

					arquivo.extensao = extensao

					arquivo.post_id = @post.id

					if not arquivo.save

						message = "Falha na inserção: "
							@post.errors.full_messages.each do |m|
							message += m
						end

						flash.now[:alert] = message
			    		render 'new'

					end

				end

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
		if session[:prof]
			@post = Post.find(params[:id])
		else
			redirect_to root_path
		end
	end

	def update

		@post = Post.find(params[:id])
		professor = Professor.find_by(siape: "#{session[:prof]}")
		if session[:prof] && professor.id==@post.professor_id
		
			if @post.update(params.require(:post).permit(:conteudo, :titulo))
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
			@arquivos = Arquivo.where(post_id: @post.id).order('created_at')
			@coments = Comentario.where(post_id: @post.id).order('created_at')
			session[:post]=params[:id]
		else
			redirect_to root_path
		end

	end

	def destroy

        @post = Post.find(params[:id])
		professor = Professor.find_by(siape: "#{session[:prof]}")
		if session[:prof] && professor.id==@post.professor_id

        	if @post.destroy
        		redirect_to professores_path, notice: "Post foi excluído"
        	else
        		redirect_to professores_path, notice: "Falha na exclusão do post"
        	end 

        else

			redirect_to :logar

		end

    end

    def videos
    	if session[:usuario] 
    		
    		@arquivos = Arquivo.joins('JOIN posts ON posts.id = arquivos.post_id').where("tipo = 'Video'").order('nome')

    	else
			redirect_to :logar
	    end
    end

end