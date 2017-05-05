class NotificationMailer < ApplicationMailer

  def product_available(notification, new_quantity)
    @user = notification.user
    @product = notification.produto
    @new_quantity = new_quantity
    # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(to: "#{@user.name} <#{@user.email}>", subject: "O produto que você procurava está disponível!")
  end
end
