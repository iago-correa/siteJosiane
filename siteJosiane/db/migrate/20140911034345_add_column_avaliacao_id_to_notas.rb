class AddColumnAvaliacaoIdToNotas < ActiveRecord::Migration
  def change
    add_column :notas, :avaliacao_id, :integer
  end
end
