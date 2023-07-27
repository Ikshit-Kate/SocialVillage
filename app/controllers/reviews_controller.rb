class ReviewsController < ApplicationController
  before_action :find_business, only: [:new, :create, :edit, :update, :destroy]

  def create
    @review = @business.reviews.build(review_params)
		@review.user = current_user
    if @review.save
      redirect_to @business, notice: "Review successfully created."
    else
      render 'business/show'
    end
  end

  def edit
    @review = @business.reviews.find(params[:id])
  end

  def update
    @review = @business.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to @business, notice: "Review successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @review = @business.reviews.find(params[:id])
    @review.destroy
    redirect_to @business, notice: "Review successfully deleted."
  end

  private

  def find_business
		@business = Business.find(params[:business_id])
		rescue ActiveRecord::RecordNotFound
		redirect_to root_path, alert: "Business not found."
	end

	def review_params
		params.require(:review).permit(:review_body)
	end
end
