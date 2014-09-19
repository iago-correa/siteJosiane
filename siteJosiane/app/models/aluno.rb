# encoding: UTF-8

class Aluno < ActiveRecord::Base

	has_many :notas
	has_many :presencas
	has_many :comentarios
	has_many :notificacoes

	validates :nome, presence: {message: "Nome não pode ficar em branco"}
	validates :matricula, presence: {message: "Matrícula não pode ficar em branco"}, 
		uniqueness:{message: "Matrícula já cadastrada"},
		numericality:{message: "Matrícula inválida"}
	validates :senha, presence: {message: "Senha não pode ficar em branco"}
	validates :email, presence: {message: "Email não pode ficar em branco"},
		uniqueness:{message: "Email já cadastrado"}
	validates :confirmado, inclusion: { in: [true, false], message: "É necessário que o aluno seja ou não confirmado"}

	validate :email?

 	private 
 	def email?
  		if not email.blank?
			errors.add(:email, "Email inválido") unless email =~ /[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})/
		end
  	end

end