class CreateNotificacoes < ActiveRecord::Migration
  def change
    create_table :notificacoes do |t|
    	t.string :aviso
    	t.timestamps :data
    	t.timestamps
    end
  end
end
