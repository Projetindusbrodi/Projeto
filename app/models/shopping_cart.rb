class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :produtos
  has_many :shopping_cart_items
  before_save :update_subtotal

  attr_reader :subtotal

  def subtotal
    shopping_cart_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def total
    shopping_cart_items.reduce(0) do |sum, shopping_cart_item|
      sum += shopping_cart_item.total_price
    end
  end

  def count_product(product_id)
    product = shopping_cart_items.detect { |item| item.produto_id == product_id }
    product&.quantity || 0
  end

  private

  def update_subtotal
    @subtotal = subtotal
  end

  def update_total
    @total = total
  end


end
