class AddColumnProfessorIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :professor_id, :integer
  end
end
