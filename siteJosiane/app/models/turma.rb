# encoding: UTF-8

class Turma < ActiveRecord::Base

	has_many :alunos

	validates :codigo, presence: {message: "Código não pode ficar em branco"}, 
		uniqueness:{message: "Turma já cadastrada"}

end