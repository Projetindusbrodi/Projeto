class Order < ApplicationRecord
  belongs_to :user
  
  def items
    JSON.parse(products)
  end
end
