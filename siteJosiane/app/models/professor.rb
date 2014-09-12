class Professor < ActiveRecord::Base

	has_many :disciplinas
	has_many :atendimentos
	has_many :posts

	validates :nome, presence: {message: "Nome não pode ficar em branco"}
	validates :siape, presence: {message: "SIAPE não pode ficar em branco"}, 
		uniqueness:{message: "SIAPE já cadastrado"}
	validates :senha, presence: {message: "Senha não pode ficar em branco"}
	validates :email, presence: {message: "Email não pode ficar em branco"}, 
		uniqueness:{message: "Email já cadastrado"}

	validate :email?

  	private def email?
  		errors.add("Email inválido") unless email =~ /[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})/
  	end

end
