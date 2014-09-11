# encoding: UTF-8

class Presenca < ActiveRecord::Base

	belongs_to :disciplinas
	belongs_to :alunos

	validates_associated :disciplina
	validates_associated :aluno

	validates :disciplina_id, presence: {message: "Não é possível ter uma presença sem disciplina associada"}
	validates :aluno_id, presence: {message: "Não é possível ter uma presença sem aluno associada"}
	validates :data, presence: {message: "Data não pode ficar em branco"}

	validate :justificado?

  	private def justificado?
  		if justificado
  			if presente
  				errors.add("Impossivel justificar enquanto presente") 
  			end
  		end
  	end

end
