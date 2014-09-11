class AddColumnAlunoIdToNotas < ActiveRecord::Migration
  def change
    add_column :notas, :aluno_id, :integer
  end
end
