class Avaliacao < ActiveRecord::Base

	belongs_to :disciplinas

	validates_presence_of :disciplina_id
	validates_associated :disciplina

	validates_presence_of :descricao, message: "Descricão não pode ficar em branco"
	validates_presence_of :peso, message: "Peso não pode ficar em branco"
	validates_presence_of :maxima, message: "Maxima não pode ficar em branco"

	validates_numericality_of :peso, message: "Peso inválido"
	validates_numericality_of :maxima, message: "Nota máxima inválida"

	validates :peso_valido?
	validates :positivo?

  	private def peso_valido?
  		errors.add("Peso deve ser entre 0 e 10") 
  		unless peso > 0 && peso >= 10
  	end

  	private def positivo?
  		errors.add("Nota máxima deve ser positiva e maior que zero") 
  		unless maxima > 0 && maxima > 0
  	end


end
