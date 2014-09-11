class AddColumnDisciplinaIdToAvaliacoes < ActiveRecord::Migration
  def change
    add_column :avaliacoes, :disciplina_id, :integer
  end
end
