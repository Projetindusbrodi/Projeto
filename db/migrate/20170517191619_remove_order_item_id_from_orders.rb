class RemoveOrderItemIdFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_columns :orders, :order_item_id
  end
end
