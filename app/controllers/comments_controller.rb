class CommentsController < ApplicationController
  before_action :find_event
  before_action :find_comment, only: %i[edit update destroy]

  def create
    @comment = @event.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.js
        format.html { redirect_to @event, notice: 'Comment was successfully created.' }
      end
    else
      respond_to do |format|
        format.js
        format.html { redirect_to @event, alert: 'Failed to create the comment.' }
      end
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @event, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment = @event.comments.find(params[:id])
    @comment.destroy
    redirect_to @event, notice: 'Comment was successfully deleted.'
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Event not found.'
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def find_comment
    @comment = @event.comments.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to @event, alert: 'Comment not found.'
  end
end
