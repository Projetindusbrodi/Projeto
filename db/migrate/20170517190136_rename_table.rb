class RenameTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :order_items, :shopping_cart_items
  end
end
