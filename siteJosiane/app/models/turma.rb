# encoding: UTF-8

class Turma < ActiveRecord::Base

	has_many :alunos	
	belongs_to :professor

	validates_associated :professor

	validates :professor_id, presence: {message: "Não é possível existir uma turma sem um professor responsável"}
	validates :codigo, presence: {message: "Código não pode ficar em branco"}, 
		uniqueness:{message: "Turma já cadastrada"}

end