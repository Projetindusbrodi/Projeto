class OrderItemsController < ApplicationController
  def create
    order = current_order
    product_id = order_item_params['produto_id'].to_i

    product = order.order_items.select { |item| item.produto_id == product_id.to_i}.first

    check = Produto.find(order_item_params['produto_id'].to_i)
    if order_item_params['quantity'].to_i + order.count_product(product_id) > check.quantidade
      redirect_to produtos_path, flash: { alert: 'Sem estoque' }
    else
      if product
        product.update(quantity: product.quantity + 1)
      else
        order_item = order.order_items.new(order_item_params)
      end

      order.user = current_user
      order.save

      session[:order_id] = order.id
      redirect_to shopping_cart_path
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items

    redirect_to shopping_cart_path
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items

    redirect_to shopping_cart_path
  end
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :produto_id)
  end
end
