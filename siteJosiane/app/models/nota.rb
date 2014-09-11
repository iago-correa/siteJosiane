class Nota < ActiveRecord::Base

	belongs_to :avaliacoes
	belongs_to :alunos

	validates_presence_of :avaliacao_id
	validates_associated :avaliacao
	validates_presence_of :aluno_id
	validates_associated :aluno

	validates_presence_of :nota, message: "Nota não pode ficar em branco"

	validates_numericality_of :nota, message: "Nota inválida"

	validates :positivo?

  	private def positivo?
  		errors.add("Nota deve ser positiva e maior que zero") 
  		unless nota > 0 
  	end

end
