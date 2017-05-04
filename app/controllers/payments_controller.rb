class PaymentsController < ApplicationController
  def show
    @payment_id = current_order.payment_id
  end

  def create
    deal_with_stock
    current_order.update(payment_id: SecureRandom.uuid)
    current_order.order_items.delete_all

    redirect_to payments_path
  end

  private

  def deal_with_stock
    current_order.order_items.each do |item|
      quantity = item.quantity
      item.produto.update(quantidade: item.produto.quantidade - quantity)
    end
  end
end
