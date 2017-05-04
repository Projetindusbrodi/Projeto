class AdminController < ApplicationController
  before_action :authorize

  def authorize
    if current_user && !current_user.admin?
      redirect_to produtos_path
    end
  end
end
