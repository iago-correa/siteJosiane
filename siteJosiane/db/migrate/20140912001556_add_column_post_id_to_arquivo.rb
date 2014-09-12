class AddColumnPostIdToArquivo < ActiveRecord::Migration
  def change
    add_column :arquivos, :post_id, :integer
  end
end
