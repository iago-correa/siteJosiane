class Professor < ActiveRecord::Base

	validates_presence_of :nome, message: "Nome não pode ficar em branco"
	validates_presence_of :siape, message: "SIAPE não pode ficar em branco"
	validates_presence_of :senha, message: "Senha não pode ficar em branco"
	validates_presence_of :email, message: "Email não pode ficar em branco"

	validates_uniqueness_of :siape, message: "SIAPE já cadastrado"
	validates_uniqueness_of :email, message: "Email já cadastrado"

	validates :email?

  	private def email?
  		errors.add("email","Email inválido") 
  		unless nome =~ /[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})/
  	end

end
