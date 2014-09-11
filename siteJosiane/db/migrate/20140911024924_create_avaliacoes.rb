class CreateAvaliacoes < ActiveRecord::Migration
  def change
    create_table :avaliacoes do |t|
    	t.string :descricao, limit: 150
    	t.float :peso
    	t.float :maxima
    	t.timestamps
    end
  end
end
