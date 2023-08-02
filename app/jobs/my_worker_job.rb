# app/jobs/my_worker_job.rb
class MyWorkerJob < ApplicationJob
    queue_as :default
  
    def perform(arg1, arg2)
      # Some custom logic based on arg1 and arg2
      # For example, sending an email notification
  
      user = User.find_by(id: arg1)
      order = Order.find_by(id: arg2)
  
      if user && order
        OrderConfirmationMailer.order_submission(order, user).deliver_now
        puts "Order confirmation email sent to #{user.email}"
      else
        puts "Error: Invalid user or order ID."
      end
    end
  end
  