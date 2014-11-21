class AddColumnTurmaIdToPresencas < ActiveRecord::Migration
  def change
    add_column :presencas, :turma_id, :integer
  end
end
