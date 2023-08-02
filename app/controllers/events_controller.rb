class EventsController < ApplicationController
  before_action :find_event, only: %i[show edit update destroy]
  load_and_authorize_resource
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(set_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def show; end

  def update
    @comment = Comment.new
    @comments = @event.comments

    if @event.update(set_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def set_params
    params.require(:event).permit(:event_name, :caption, images: [])
  end
end
