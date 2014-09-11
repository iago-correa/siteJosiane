class Atendimento < ActiveRecord::Base

	belongs_to :professores

	validates_presence_of :professor_id
	validates_associated :professor
	
	validates_presence_of :hora_inicio, message: "Hora de início não pode ficar em branco"
	validates_presence_of :hora_fim, message: "Hora de fim não pode ficar em branco"
	validates_presence_of :dia, message: "Dia não pode ficar em branco"

	validates :duracao?
	validates :dia?

	private def duracao?
		errors.add("O horário do fim deve ser depois do início")
		unless hora_fim > hora_inicio
	end

  	private def dia?
  		errors.add("Formato de dia inválido") 
  		unless dia == "dom" || dia == "seg" ||
  			   dia == "ter" || dia == "qua" ||
  			   dia == "qui" || dia == "sex" ||
  			   dia == "sab" 
  	end

end
