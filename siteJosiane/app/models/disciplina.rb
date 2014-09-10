class Disciplina < ActiveRecord::Base

	belongs_to :professores

	validates_presence_of :professor_id
	validates_associated :professor

	validates_presence_of :nome, message: "Nome não pode ficar em branco"
	validates_presence_of :chs, message: "CHS não pode ficar em branco"
	validates_presence_of :cht, message: "CHT não pode ficar em branco"

	validates :positivo?

  	private def positivo?
  		errors.add("Carga horárias devem ser positivas e maiores que zero") 
  		unless chs > 0 && cht > 0
  	end


end
