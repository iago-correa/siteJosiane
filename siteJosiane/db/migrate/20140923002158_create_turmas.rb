class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
		t.string :codigo, limit: 4
    	t.timestamps
    end
  end
end
