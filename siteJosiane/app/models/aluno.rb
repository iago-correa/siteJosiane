# encoding: UTF-8

class Aluno < ActiveRecord::Base

	has_many :notas
	has_many :presencas

	validates :nome, presence: {message: "Nome não pode ficar em branco"}
	validates :matricula, presence: {message: "Matrícula não pode ficar em branco"}, 
		uniqueness:{message: "Matrícula já cadastrada"},
		numericality:{message: "Matrícula inválida"}
	validates :senha, presence: {message: "Senha não pode ficar em branco"}
	validates :confirmado, presence: {message: "É necessário que o aluno seja ou não confirmado"},
		uniqueness:{message: "Email já cadastrado"}

	validate :email?

  	private def email?
  		if email != nil
  			errors.add("Email inválido") unless email =~ /[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})/
  		end
  	end

end