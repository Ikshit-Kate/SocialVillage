class BroadcastsController < ApplicationController
  def index
    @broadcasts = Broadcast.all
  end

  def new
    @broadcast = Broadcast.new
  end

  def create
    @broadcast = Broadcast.new(set_params)
    if @broadcast.save
      # Handle successful save
      redirect_to  broadcasts_path, notice: 'Suggestion created successfully!'
    else
      # Handle failed save
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:broadcast).permit(:heading, :body)
  end
end
