class CreatePresencas < ActiveRecord::Migration
  def change
    create_table :presencas do |t|
    	t.timestamps :data	
    	t.boolean :presente	
    	t.boolean :justificado
    	t.timestamps
    end
  end
end
