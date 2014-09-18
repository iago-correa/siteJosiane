class AlunosController < ApplicationController

	def new
	  @aluno = Aluno.new
	end

	def create
		
		senha = params.require(:aluno).permit(:senha)
		senha2 = params.require(:aluno).permit(:senha2)
		
		#if senha == senha2
  		
	  		@aluno = Aluno.new params.require(:aluno).permit(:nome, :matricula, :senha, :email)
	  		@aluno.confirmado = false
	  		@aluno.save

  		#else

  		#	@msg = "Senhas não verificam"
  			redirect_to action: "new"

  		#end

	end

end

