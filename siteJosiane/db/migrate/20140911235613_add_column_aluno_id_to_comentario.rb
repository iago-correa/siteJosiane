class AddColumnAlunoIdToComentario < ActiveRecord::Migration
  def change
    add_column :comentarios, :aluno_id, :integer
  end
end
