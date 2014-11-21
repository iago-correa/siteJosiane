class AddColumnTurmaIdToAvaliacoes < ActiveRecord::Migration
  def change
    add_column :avaliacoes, :turma_id, :integer
  end
end
