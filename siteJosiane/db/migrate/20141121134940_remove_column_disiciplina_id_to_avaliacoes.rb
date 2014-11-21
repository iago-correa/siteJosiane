class RemoveColumnDisiciplinaIdToAvaliacoes < ActiveRecord::Migration
  def change
  	remove_column :avaliacoes, :disciplina_id
  end
end
