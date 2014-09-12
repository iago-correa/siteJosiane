# encoding: UTF-8

class Post < ActiveRecord::Base

	belongs_to :professores
	has_many :comentarios
	has_many :arquivos
	has_many :notificacoes

	validates_associated :professor

	validates :professor_id, presence: {message: "Não é possível existir um post sem um professor"}
	validates :conteudo, presence: {message: "Conteúdo não pode ficar em branco"},
		uniqueness:{message: "Conteúdo já postado"}
	validates :data, presence: {message: "Data não pode ficar em branco"}
	validates :tipo, presence: {message: "Tipo não pode ficar em branco"}

	validate :data?

  	private def data?
  		errors.add("Post deve ter uma data não antiga") unless data > Time.now
  	end

end