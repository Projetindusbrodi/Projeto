class AddDepartamentoToProdutos < ActiveRecord::Migration[5.0]
  def change
    add_column :produtos, :department_id, :integer
  end
end
