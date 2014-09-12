class AddColumnPostIdToNotificacao < ActiveRecord::Migration
  def change
    add_column :notificacoes, :post_id, :integer
  end
end
