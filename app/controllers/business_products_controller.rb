# frozen_string_literal: true

# scope bnana queries ke liye
# ---------------------------
class BusinessProductsController < ApplicationController
  def index
    if params[:business_product].present?
      @search = BusinessProduct.new(business_name: params[:business_product][:business_name])
      @businessproducts = BusinessProduct.where(business_name: @search.business_name) 
    else
      @search = BusinessProduct.new
      @businessproducts = BusinessProduct.all
    end
  end
  

  def new
    @businessproduct = BusinessProduct.new
  end

  def create
    
    @businessproduct = BusinessProduct.new(set_params)
    @businessname = @businessproduct.business_name

    if @businessname.present?
      @owner = Business.where(name: @businessname).take

      if @owner
        @businessproduct.business_id = @owner.id
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

    if @businessproduct.save
      redirect_to business_products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @businessproduct = BusinessProduct.find(params[:id])
  end

  def update
    @businessproduct = BusinessProduct.find(params[:id])
    if @businessproduct.update(set_params)
      redirect_to  business_products_path 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @businessproduct = BusinessProduct.find(params[:id])
    @businessproduct.destroy
    redirect_to  business_products_path 
  end

  private

  def set_params
    params.require(:business_product).permit(:name, :brand, :price, :business_name)
  end
end

