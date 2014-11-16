class RemoveColumnDataToComentarios < ActiveRecord::Migration
  def change
  	remove_column :comentarios, :data
  end
end
