class Presenca < ActiveRecord::Base

	belongs_to :disciplinas
	belongs_to :alunos

	validates_presence_of :disciplina_id
	validates_associated :disciplina
	validates_presence_of :aluno_id
	validates_associated :aluno

	validates_presence_of :data, message: "Data não pode ficar em branco"

	validates :justificado?

  	private def justificado?
  		if justificado
  			if presente
  				errors.add("Impossivel justificar enquanto presente") 
  			end
  		end
  	end

end
