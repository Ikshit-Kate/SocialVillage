class OrderConfirmationMailer < ApplicationMailer
  def order_submission(order, user)
    @order = order
    @user = user
    @user_name = @user.username
    @seller_email = @order.business.email
    mail(to: @seller_email, from: @user.email, subject: "Order Recieved from #{@user_email}")
  end
end
