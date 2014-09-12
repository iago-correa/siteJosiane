class AddColumnAlunoIdToNotificacao < ActiveRecord::Migration
  def change
    add_column :notificacoes, :aluno_id, :integer
  end
end
