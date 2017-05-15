class NotificationsController < ApplicationController

  def create
    unless Notification.exists?(produto_id: Produto.find(params[:produto_id].to_i), user_id: current_user.id)
      @notification = Notification.new
      @notification.produto = Produto.find(params[:produto_id])
      @notification.user = current_user
      @notification.save

      flash[:notice] = 'Uma notificação será enviada por email caso produto esteja disponível.'
    end

    flash[:notice] = 'Aguarde a notificação por email.'
    redirect_to produtos_path
  end
end
