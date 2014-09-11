class AddColumnAlunoIdToPresencas < ActiveRecord::Migration
  def change
    add_column :presencas, :aluno_id, :integer
  end
end
