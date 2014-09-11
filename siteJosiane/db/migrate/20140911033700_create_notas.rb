class CreateNotas < ActiveRecord::Migration
  def change
    create_table :notas do |t|
    	t.float :nota
    	t.timestamps
    end
  end
end
