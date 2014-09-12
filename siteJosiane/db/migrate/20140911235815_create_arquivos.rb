class CreateArquivos < ActiveRecord::Migration
  def change
    create_table :arquivos do |t|
    	t.string :nome, limit: 200
    	t.string :extensao, limit: 4
    	t.timestamps
    end
  end
end
