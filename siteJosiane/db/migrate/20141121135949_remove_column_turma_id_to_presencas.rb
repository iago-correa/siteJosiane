class RemoveColumnTurmaIdToPresencas < ActiveRecord::Migration
  def change
  	remove_column :presencas, :turma_id
  end
end
