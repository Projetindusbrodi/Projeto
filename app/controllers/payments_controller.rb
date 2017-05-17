class PaymentsController < ApplicationController
  def show
    @payment_id = Order.where(user_id: current_user.id).order('created_at desc').last.payment_id
  end

  def create
    deal_with_stock
    Order.create(
      user_id: current_user.id,
      payment_id: SecureRandom.uuid,
      products: current_shopping_cart.shopping_cart_items.to_json
    )

    current_shopping_cart.shopping_cart_items.destroy_all

    redirect_to payments_path
  end

  private

  def deal_with_stock
    current_shopping_cart.shopping_cart_items.each do |item|
      quantity = item.quantity
      item.produto.update(quantidade: item.produto.quantidade - quantity)
    end
  end
end
