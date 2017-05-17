class AddProdutsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :products, :jsonb
  end
end
