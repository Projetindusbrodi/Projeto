class ChangeOrderIdOnOrderItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :order_items, :order_id, :shopping_cart_id
  end
end
