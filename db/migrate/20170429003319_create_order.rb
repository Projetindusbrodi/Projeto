class CreateOrder < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :number_order
      t.integer :ra
      t.float :valor
      t.text :descricao
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3

      t.timestamps
    end
    add_index :orders, :ra
  end
end
