class ReviewsController < ApplicationController
  before_action :find_business
  before_action :find_comment, only: %i[edit update destroy]
  load_and_authorize_resource

  def create
    @review = @business.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @business, notice: 'Review successfully created.'
    else
      redirect_to @business, alert: 'Failed to create the comment.'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @business, notice: 'Review successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @business, notice: 'Review successfully deleted.'
  end

  private

  def find_comment
    @review = @business.reviews.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to @business, alert: 'Event not found.'
  end

  def find_business
    @business = Business.find(params[:business_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to @business, alert: 'Business not found.'
  end

  def review_params
    params.require(:review).permit(:review_body)
  end
end
