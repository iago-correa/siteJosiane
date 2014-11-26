class AddColumnArquivoNomeToArquivos < ActiveRecord::Migration
  def change
    add_column :arquivos, :arquivo_nome, :string
  end
end