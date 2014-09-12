class AddColumnDataToComentario < ActiveRecord::Migration
  def change
    add_column :comentarios, :data, :timestamps
  end
end
