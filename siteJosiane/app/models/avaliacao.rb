# encoding: UTF-8

class Avaliacao < ActiveRecord::Base

	belongs_to :turma
	has_many :notas

	validates_associated :turma

	validates :turma_id, presence: {message: "Não é possível existir uma avaliação sem uma turma"}
	validates :descricao, presence: {message: "Descricão não pode ficar em branco"}
	validates :peso, presence: {message: "Peso não pode ficar em branco"}, 
		numericality:{message: "Peso inválido"}
	validates :maxima, presence: {message: "Maxima não pode ficar em branco"}, 
		numericality:{message: "Nota máxima inválida"}

	validate :peso_valido?
	validate :positivo?

  	private 
  	def peso_valido?
  		errors.add(:peso, "Peso deve ser entre 0 e 10") unless peso > 0 && peso <= 10
  	end

	def positivo?
  		errors.add(:maxima, "Nota máxima deve ser positiva e maior que zero") unless maxima > 0 
  	end

end
