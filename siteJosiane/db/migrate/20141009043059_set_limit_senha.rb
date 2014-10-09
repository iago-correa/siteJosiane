class SetLimitSenha < ActiveRecord::Migration
  def change
  	change_column :alunos, :senha, :string, :limit => 32
  end
end
