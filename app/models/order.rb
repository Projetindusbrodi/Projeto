class Order < ApplicationRecord
  def items
    JSON.parse(products)
  end
end
