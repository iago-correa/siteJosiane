class AddColumnProfessorIdToAtendimento < ActiveRecord::Migration
  def change
    add_column :atendimentos, :professor_id, :integer
  end
end
