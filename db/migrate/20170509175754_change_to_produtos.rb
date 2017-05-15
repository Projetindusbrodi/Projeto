class ChangeToProdutos < ActiveRecord::Migration[5.0]
  def up
    change_column :produtos, :valor, :decimal, precision: 12, scale: 3
  end

  def down
    change_column :produtos, :valor, :float
  end
end
