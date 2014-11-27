# encoding: UTF-8

class ArquivosController < ApplicationController

	def new
		if session[:prof] 
			@arquivo = Arquivo.new
		else
			redirect_to :logar
		end
	end

	def create
		
		if session[:prof]

			post = Post.find(session[:post])

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

				arquivo.post_id = post.id



				if not arquivo.save

					message = "Falha na inserção: "
						@post.errors.full_messages.each do |m|
						message += m
					end

					flash.now[:alert] = message
			    	render 'new'

			    else

			    	redirect_to post

				end

			end

	  	else

			redirect_to :logar

		end
 
	end

	def destroy

        @arquivo = Arquivo.find(params[:id])
        nome = @arquivo.nome+"."+@arquivo.extensao
        @post = Post.find(@arquivo.post_id)
		professor = Professor.find_by(siape: "#{session[:prof]}")

		if session[:prof] && professor.id==@post.professor_id			
			
        	if File.delete(File.absolute_path("public/uploads/#{nome}"))
        		if @arquivo.destroy
        			redirect_to @post, notice: "Arquivo excluído com sucesso"
	        	else
	        		redirect_to @post, notice: "Falha na exclusão do arquivo"
	        	end
        	else
        		redirect_to @post, notice: "Falha na exclusão do arquivo"
        	end 

        else

			redirect_to :logar

		end

    end

end