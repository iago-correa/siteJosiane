# encoding: UTF-8

class Presenca < ActiveRecord::Base

	belongs_to :disciplina
	belongs_to :aluno

	validates_associated :disciplina
	validates_associated :aluno

	validates :disciplina_id, presence: {message: "Não é possível ter uma presença sem disciplina associada"}
	validates :aluno_id, presence: {message: "Não é possível ter uma presença sem aluno associada"}

	validate :justificado?

  	private
  	def justificado?
  		if justificado
  			if presente
  				errors.add("Impossivel justificar enquanto presente") 
  			end
  		end
  	end

end
