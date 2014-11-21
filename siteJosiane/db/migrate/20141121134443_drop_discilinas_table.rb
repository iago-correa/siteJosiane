class DropDiscilinasTable < ActiveRecord::Migration
  def change
  	drop_table :disciplinas
  end
end
