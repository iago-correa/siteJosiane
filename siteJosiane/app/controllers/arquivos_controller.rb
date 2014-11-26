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

    			path = File.join(Rails.root, "public/uploads", name)

    			File.open(path, "wb") do |f| 
  					f.write( params['arquivo'].read)
				end

				parts = name.partition(".") 

				extensao = parts.last

				file_name = name.delete("."+extensao)

				arquivo = Arquivo.new

				arquivo.nome = file_name

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

end