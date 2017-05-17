class AddOrdersToUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :number_order
    remove_column :orders, :ra
    remove_column :orders, :valor
    remove_column :orders,  :descricao
    add_column :orders, :user_id, :integer
    add_column :orders, :order_item_id, :integer

  end
end
