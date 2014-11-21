class AddColumnProfessorIdToTurma < ActiveRecord::Migration
  def change
    add_column :turmas, :professor_id, :integer
  end
end