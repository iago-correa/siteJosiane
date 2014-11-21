class RemoveColumnDisiciplinaIdToPresencas < ActiveRecord::Migration
  def change
  	remove_column :presencas, :disciplina_id
  end
end
