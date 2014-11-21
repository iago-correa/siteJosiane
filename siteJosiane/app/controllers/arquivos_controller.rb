# encoding: UTF-8

class ArquivosController < ApplicationController

	def create
		
		if session[:prof]

			post = Post.find(session[:post])

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

end