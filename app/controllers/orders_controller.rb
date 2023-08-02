# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def new
    @order = Order.new
  end

  def create
    @current_user = current_user
    @order = Order.new(set_params)
    @order.user_id = current_user.id
    @businessname = @order.business_name

    if @businessname.present?
      @business = Business.where(name: @businessname).take

      if @business
        @order.business_id = @business.id
      else
        flash.now[:alert] = 'Business with the provided name not found.'
        redirect_to business_products_path status: :unprocessable_entity
        return
      end
    else
      flash.now[:alert] = 'Business name is missing.'
      redirect_to business_products_path, status: :unprocessable_entity
      return
    end
    if @order.save
      # Somewhere in your code
      MyWorkerJob.perform_later(current_user.id, @order.id)
      redirect_to business_products_path, notice: 'Order created successfully!'
    else
      redirect_to business_products_path, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.permit(:customer_order, :business_name)
  end
end
