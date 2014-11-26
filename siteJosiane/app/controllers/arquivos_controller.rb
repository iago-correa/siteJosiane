# encoding: UTF-8

class ArquivosController < ApplicationController

	def create
		
		if session[:prof]

			post = Post.find(session[:post])

			name = params['arquivo'].original_filename


			@arquivo = Arquivo.new params.require(:arquivo).permit(:nome, :extensao)
			@arquivo.post_id = post.id
			
			if @arquivo.save
				redirect_to professores_path
			else		
				message = "Falha na inserção: "
				@arquivo.errors.full_messages.each do |m|
					message += m
				end

				flash.now[:alert] = message
	    		render 'create'
  			end

  		else

			redirect_to :logar

		end
 
	end






  def self.save(upload)
    name =  upload['datafile'].original_filename
    directory = "public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end

















end