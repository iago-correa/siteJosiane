# encoding: UTF-8

class Comentario < ActiveRecord::Base

	belongs_to :post
	belongs_to :aluno

	validates_associated :post
	validates_associated :aluno

	validates :post_id, presence: {message: "Não é possível existir um comentário sem um post"}
	validates :conteudo, presence: {message: "Conteúdo não pode ficar em branco"}

end