# frozen_string_literal: true

class BusinessProductsController < ApplicationController
  before_action :find_businessproduct, only: %i[edit update destroy]

  def index
    if params[:business_product].present?
      @search = BusinessProduct.new(business_name: params[:business_product][:business_name])
      @businessproducts = BusinessProduct.where(business_name: @search.business_name).page(params[:page]).per(4)
    else
      @search = BusinessProduct.new
      @businessproducts = BusinessProduct.all.page(params[:page]).per(4)
    end
  end

  def new
    @businessproduct = BusinessProduct.new
  end

  def create
    @businessproduct = BusinessProduct.new(set_params)
    @businessname = @businessproduct.business_name

    if @businessname.present?
      @business = Business.where(name: @businessname).take

      if @business
        @businessproduct.business_id = @business.id
        @owner = @business.user
      else
        flash.now[:alert] = 'User with the provided username not found.'
        render :new, status: :unprocessable_entity
        return
      end
    else
      flash.now[:alert] = 'Owner username is missing.'
      render :new, status: :unprocessable_entity
      return
    end

    if @owner.id == current_user.id
      if @businessproduct.save
        redirect_to business_products_path
      else
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = 'You can only add products to your business'
      render :new, status: :unprocessable_entity
      nil
    end
  end

  def edit; end

  def update
    if @businessproduct.update(set_params)
      redirect_to business_products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @businessproduct.destroy
    redirect_to business_products_path
  end

  private

  def find_businessproduct
    @businessproduct = BusinessProduct.find(params[:id])
  end

  def set_params
    params.require(:business_product).permit(:name, :brand, :price, :business_name)
  end
end
