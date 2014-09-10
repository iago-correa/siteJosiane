class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
    	t.string :nome, limit: 100
    	t.string :matricula, limit: 8
    	t.string :senha, limit: 30
    	t.string :email, limit: 250
    	t.boolean :confirmado
    	t.timestamps
    end
  end
end
