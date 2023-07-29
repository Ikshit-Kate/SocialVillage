
class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(set_params)
    @business_owner_name = @business.owner_username

    if @business_owner_name.present?
      @owner = User.where(username: @business_owner_name).take

      if @owner
        @business.user_id = @owner.id
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

    if @business.save
      redirect_to @business
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @business = Business.find(params[:id])
  end

  def show
    @business = Business.find(params[:id])
    @review = @business.reviews.build
  end

  def update
    @business = Business.find(params[:id])
    if @business.update(set_params)
      redirect_to @business
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @business = Business.find(params[:id])
    @business.destroy
    redirect_to businesses_path
  end

  private

  def set_params
    params.require(:business).permit(:name, :email, :contact_number, :address, :owner_username, images: [])
  end
end
