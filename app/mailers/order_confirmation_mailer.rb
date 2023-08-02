# frozen_string_literal: true

class OrderConfirmationMailer < ApplicationMailer
  def order_submission(order, user)
    @order = order
    @user = user
    mail(to: @order.business.email, from: @user.email, subject: "Order Recieved from #{@user.username}")
  end
end
