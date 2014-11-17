# encoding: UTF-8
class Professor < ActiveRecord::Base

	attr_accessor :senha2

	has_many :disciplinas
	has_many :atendimentos
	has_many :posts

	validates :nome, presence: {message: " não pode ficar em branco. "}
	validates :siape, presence: {message: " não pode ficar em branco. "}, 
		uniqueness:{message: " já cadastrado. "}
	validates :senha, presence: {message: " não pode ficar em branco. "}
	validates :email, presence: {message: " não pode ficar em branco. "}, 
		uniqueness:{message: " já cadastrado. "}

	validate :email?
	validate :siape?

 	private 
 	def email?
  		if not email.nil?
			errors.add(:email, " inválido. ") unless email =~ /[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})/
		end
  	end

 	private 
 	def siape?
  		if not siape.blank?
			errors.add(:siape, " inválido \n") if siape =~ /\s/
		end
  	end

end
