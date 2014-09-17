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

	private def duracao?
		errors.add("O horário do fim deve ser depois do início") unless hora_fim > hora_inicio
	end

  	private def dia?
  		errors.add("Formato de dia inválido") unless dia == "dom" || dia == "seg" ||
  			dia == "ter" || dia == "qua" ||
  			dia == "qui" || dia == "sex" ||
  			dia == "sab" 
  	end

end
