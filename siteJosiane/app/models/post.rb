# encoding: UTF-8

class Post < ActiveRecord::Base

	belongs_to :professor
	has_many :comentarios
	has_many :arquivos
	has_many :notificacoes

	validates_associated :professor

	validates :professor_id, presence: {message: "Não é possível existir um post sem um professor"}
	validates :conteudo, presence: {message: "Conteúdo não pode ficar em branco"},
		uniqueness:{message: "Conteúdo já postado"}
	validates :tipo, presence: {message: "Tipo não pode ficar em branco"}
	validates :titulo, presence: {message: "Não é possível existir um post sem um titulo"}

end