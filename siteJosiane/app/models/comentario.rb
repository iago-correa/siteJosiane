# encoding: UTF-8

class Comentario < ActiveRecord::Base

	belongs_to :posts
	belongs_to :alunos

	validates_associated :post
	validates_associated :aluno

	validates :post_id, presence: {message: "Não é possível existir um comentário sem um post"}
	validates :conteudo, presence: {message: "Conteúdo não pode ficar em branco"},
		uniqueness:{message: "Conteúdo já comentado"},
	validates :data, presence: {message: "Data não pode ficar em branco"}

	validate :data?

  	private def data?
  		errors.add("Comentário deve ter uma data não antiga") unless data > Time.now
  	end

end
