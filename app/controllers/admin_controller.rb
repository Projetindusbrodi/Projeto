class AdminController < ApplicationController
  private

  def authenticate
    authenticate_or_request_with_http_basic("Application") do |email, password|
      admin = AdminUser.find_by(email: email)
      admin && admin.authenticate(password)
    end
  end

  helper_method :authenticate
end
