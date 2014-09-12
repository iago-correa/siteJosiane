class AddColumnDisciplinaIdToPresenca < ActiveRecord::Migration
  def change
    add_column :presencas, :disciplina_id, :integer
  end
end
