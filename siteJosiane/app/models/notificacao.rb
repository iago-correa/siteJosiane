class Notificacao < ActiveRecord::Base

	belongs_to :alunos
	belongs_to :posts

	validates_associated :post
	validates_associated :aluno

	validates :post_id, presence: {message: "Não é possível existir uma notificação sem um aluno associado"}
	validates :aluno_id, presence: {message: "Não é possível existir uma notificação sem um aluno para recebê-la"}
	validates :data, presence: {message: "Data não pode ficar em branco"}
	validates :aviso, presence: {message: "Aviso não pode ficar em branco"},
		uniqueness:{message: "Conteúdo já postado"}

end