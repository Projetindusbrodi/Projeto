class ShoppingCartItem < ApplicationRecord
  belongs_to :produto
  belongs_to :shopping_cart

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :produto_present
  validate :shopping_cart_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      produto.valor
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def produto_present
    if produto.nil?
      errors.add(:produto, "is not valid or is not active.")
    end
  end

  def shopping_cart_present
    if shopping_cart.nil?
      errors.add(:shopping_cart, "is not a valid cart.")
    end
  end

  def finalize
   self[:unit_price] = unit_price
   self[:total_price] = quantity * self[:unit_price]
 end
end
