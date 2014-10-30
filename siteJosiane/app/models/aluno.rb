# encoding: UTF-8

class Aluno < ActiveRecord::Base

	belongs_to :turma
	has_many :notas
	has_many :presencas
	has_many :comentarios
	has_many :notificacoes
	
	validates_associated :turma

	validates :turma_id, presence: {message: "Todo aluno deve pertencer a uma turma"}
	validates :nome, presence: {message: " não pode ficar em branco. "}
	validates :matricula, presence: {message: " não pode ficar em branco. "}, 
		uniqueness:{message: " já cadastrada. "},
		numericality:{message: " inválida. "}
	validates :senha, presence: {message: " não pode ficar em branco. "}
	validates :email, presence: {message: " não pode ficar em branco. "},
		uniqueness:{message: " já cadastrado. "}
	validates :confirmado, inclusion: { in: [true, false], message: "É necessário que o aluno seja ou não confirmado"}

	validate :email?

 	private 
 	def email?
  		if not email.blank?
			errors.add(:email, " inválido \n") unless email =~ /[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})/
		end
  	end

end