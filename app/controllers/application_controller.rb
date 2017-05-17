class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_shopping_cart

  def current_shopping_cart
    @cart ||= begin
      session[:user_id] = current_user.id unless session[:user_id]

      ShoppingCart.find_or_create_by(user_id: session[:user_id])
    end
  end
end
