class EventsController < ApplicationController
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

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @comment = Comment.new
    @comments = @event.comments
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Event not found."
    if @event.update(set_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def set_params
    params.require(:event).permit(:event_name, :caption, images: [])
  end
end
