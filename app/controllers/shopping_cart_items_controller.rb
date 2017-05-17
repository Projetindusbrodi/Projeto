class ShoppingCartItemsController < ApplicationController
  def create
    order = current_shopping_cart
    product_id = shopping_cart_item_params['produto_id'].to_i

    product = order.shopping_cart_items.find { |item| item.produto_id == product_id.to_i}

    check = Produto.find(shopping_cart_item_params['produto_id'].to_i)
    if shopping_cart_item_params['quantity'].to_i + order.count_product(product_id) > check.quantidade
      redirect_to produtos_path, flash: { alert: 'Sem estoque' }
    else
      if product
        product.update(quantity: product.quantity + 1)
      else
        shopping_cart_item = order.shopping_cart_items.new(shopping_cart_item_params)
      end

      order.user = current_user
      order.save

      session[:order_id] = order.id
      redirect_to shopping_cart_path
    end
  end

  def update
    @order = current_shopping_cart
    @shopping_cart_item = @order.shopping_cart_items.find(params[:id])
    @shopping_cart_item.update_attributes(shopping_cart_item_params)
    @shopping_cart_items = @order.shopping_cart_items

    redirect_to shopping_cart_path
  end

  def destroy
    @order = current_shopping_cart
    @shopping_cart_item = @order.shopping_cart_items.find(params[:id])
    @shopping_cart_item.destroy
    @shopping_cart_items = @order.shopping_cart_items

    redirect_to shopping_cart_path
  end
private
  def shopping_cart_item_params
    params.require(:shopping_cart_item).permit(:quantity, :produto_id)
  end
end
