class CreateProfessores < ActiveRecord::Migration
  def change
    create_table :professores do |t|
    	t.string :nome, limit: 100
    	t.string :email, limit: 250
    	t.string :senha, limit: 30
    	t.string :siape, limit: 10
    	t.timestamps
    end
  end
end
