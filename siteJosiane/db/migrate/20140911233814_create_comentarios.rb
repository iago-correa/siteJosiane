class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
    	t.string :conteudo
    	t.timestamps
    end
  end
end
