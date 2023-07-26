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
      redirect_to  broadcasts_path, notice: 'Suggestion created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @broadcast = Broadcast.find(params[:id])
  end

  def update
    @broadcast = Broadcast.find(params[:id])
    if @broadcast.update(set_params)
      redirect_to broadcasts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @broadcast = Broadcast.find(params[:id])
    @broadcast.destroy
    redirect_to broadcasts_path
  end

  private

  def set_params
    params.require(:broadcast).permit(:heading, :body)
  end
end
