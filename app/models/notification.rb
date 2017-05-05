class Notification < ApplicationRecord
  belongs_to :produto
  belongs_to :user

  def self.notify_user(produto, quantidade)
    if produto.quantidade == 0 && quantidade > 0
      notifications = Notification.where(produto_id: produto.id)
      notifications.each do |notification|
        NotificationMailer.product_available(notification, quantidade).deliver_now
        notification.destroy
      end
    end
  end
end
