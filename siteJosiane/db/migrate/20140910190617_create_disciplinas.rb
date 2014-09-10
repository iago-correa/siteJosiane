class CreateDisciplinas < ActiveRecord::Migration
  def change
    create_table :disciplinas do |t|
    	t.string :nome, limit: 75
    	t.integer :chs
    	t.integer :cht
    	t.timestamps
    end
  end
end
