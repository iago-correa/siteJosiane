class AddColumnProfessorIdToDisciplinas < ActiveRecord::Migration
  def change
    add_column :disciplinas, :professor_id, :integer
  end
end
