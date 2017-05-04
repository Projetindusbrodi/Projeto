class Order < ApplicationRecord
  belongs_to :user, foreign_key: :ra
  has_and_belongs_to_many :produtos
  has_many :order_items
  before_save :update_subtotal

  attr_reader :subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def total
    order_items.reduce(0) do |sum, order_item|
      sum += order_item.total_price
    end
  end

  private

  def update_subtotal
    @subtotal = subtotal
  end

  def update_total
    @total = total
  end

end
