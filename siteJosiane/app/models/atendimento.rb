# encoding: UTF-8

class Atendimento < ActiveRecord::Base

	belongs_to :professor

	validates_associated :professor

	validates :professor_id, presence: {message: "Não é possível existir um atendimento sem um professor responsável"}
	validates :hora_inicio, presence: {message: "Hora de início não pode ficar em branco"}
	validates :hora_fim, presence: {message: "Hora de fim não pode ficar em branco"}
	validates :dia, presence: {message: "Dia não pode ficar em branco"}

	validate :duracao?
	validate :dia?

	private
	def duracao?
		errors.add(:hora_fim, "O horário do fim deve ser depois do início") unless hora_fim > hora_inicio
	end
 
  	def dia?
  		errors.add(:dia, "Formato de dia inválido") unless dia == "1" ||
  			dia == "2" || dia == "3" ||
  			dia == "4" || dia == "5" 
  	end

end
