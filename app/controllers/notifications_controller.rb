class NotificationsController < ApplicationController

  def create
    @notification = Notification.new
    @notification.produto = Produto.find(params[:produto_id])
    @notification.user = current_user
    @notification.save

    flash[:notice] = "Uma notificação será enviada por email caso produto esteja disponível."
    redirect_to produtos_path
  end
end
