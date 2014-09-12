class AddColumnPostIdToComentario < ActiveRecord::Migration
  def change
    add_column :comentarios, :post_id, :integer
  end
end
