# encoding: UTF-8

class Nota < ActiveRecord::Base

	belongs_to :avaliacao
	belongs_to :aluno

	validates_associated :avaliacao
	validates_associated :aluno

	validates :avaliacao_id, presence: {message: "Não é possível existir uma nota sem uma avaliacao"}
	validates :aluno_id, presence: {message: "Não é possível existir uma nota sem um aluno"}
	validates :nota, presence: {message: "Nota não pode ficar em branco"},
		numericality: {message: "Nota inválida"}

	validate :positivo?

  	private
  	def positivo?
  		errors.add("Nota deve ser positiva e maior que zero") unless nota > 0 
  	end

end
