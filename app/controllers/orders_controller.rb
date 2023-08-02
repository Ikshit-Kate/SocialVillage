# frozen_string_literal: true

class OrdersController < ApplicationController

  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(set_params)
    @order.user = current_user
    if @order.business_name.present?
      @business = Business.where(name: @order.business_name).take
      if @business
        @order.business = @business
      else
        redirect_to business_products_path, status: :unprocessable_entity
        flash.now[:alert] = 'Business with the provided name not found.'
        return
      end
    else
      flash.now[:alert] = 'Business name is missing.'
      redirect_to business_products_path, status: :unprocessable_entity
      return
    end
    if @order.save
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
