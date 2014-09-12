class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :conteudo
    	t.timestamps :data
    	t.string :tipo, limit: 3
    	t.timestamps
    end
  end
end
