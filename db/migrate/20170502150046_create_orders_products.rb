class CreateOrdersProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_produtos do |t|
      t.integer :order_id
      t.integer :produto_id
    end
  end
end
