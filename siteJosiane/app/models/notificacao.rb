class Notificacao < ActiveRecord::Base

	belongs_to :aluno
	belongs_to :post

	validates_associated :post
	validates_associated :aluno

	validates :post_id, presence: {message: "Não é possível existir uma notificação sem um aluno associado"}
	validates :aluno_id, presence: {message: "Não é possível existir uma notificação sem um aluno para recebê-la"}
	validates :aviso, presence: {message: "Aviso não pode ficar em branco"}

end