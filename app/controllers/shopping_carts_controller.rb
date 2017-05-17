class ShoppingCartsController < ApplicationController
  def show
    @shopping_cart_items = current_shopping_cart.shopping_cart_items
  end
end
