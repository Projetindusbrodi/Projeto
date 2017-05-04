class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    Order.find_or_initialize_by(id: session[:order_id])
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic("Application") do |ra, password|
      aluno = Aluno.find_by(ra: ra)
      aluno && aluno.authenticate(password)
    end
  end

  helper_method :authenticate
end
