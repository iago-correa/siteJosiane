class CreateAtendimentos < ActiveRecord::Migration
  def change
    create_table :atendimentos do |t|
    	t.time :hora_inicio
    	t.time :hora_fim
    	t.string :dia, limit: 3
    	t.timestamps
    end
  end
end
