class Aluno < ActiveRecord::Base

	has_many :notas

	validates_presence_of :nome, message: "Nome não pode ficar em branco"
	validates_presence_of :matricula, message: "Matrícula não pode ficar em branco"
	validates_presence_of :senha, message: "Senha não pode ficar em branco"
	validates_presence_of :confirmado, message: "É necessário que o aluno seja ou não confirmado"

	validates_uniqueness_of :matricula, message: "Matrícula já cadastrada"
	validates_uniqueness_of :email, message: "Email já cadastrado"

	validates_numericality_of :matricula, message: "Matrícula inválida"

	validates :email?

  	private def email?
  		errors.add("Email inválido") 
  		unless email =~ /[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})/
  	end

end
