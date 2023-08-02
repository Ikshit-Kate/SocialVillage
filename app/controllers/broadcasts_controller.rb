# frozen_string_literal: true

class BroadcastsController < ApplicationController
  before_action :find_broadcast, only: %i[edit update destroy]
  load_and_authorize_resource

  def index
    @broadcasts = Broadcast.all.order(created_at: :desc)
  end

  def new
    @broadcast = Broadcast.new
  end

  def create
    @broadcast = Broadcast.new(set_params)
    if @broadcast.save
      BroadcastmailMailer.broadcast(@broadcast).deliver_now
      redirect_to  broadcasts_path, notice: 'Suggestion created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @broadcast.update(set_params)
      BroadcastmailMailer.broadcast(@broadcast).deliver_now
      redirect_to broadcasts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @broadcast.destroy
    redirect_to broadcasts_path
  end

  private

  def find_broadcast
    @broadcast = Broadcast.find(params[:id])
  end

  def set_params
    params.require(:broadcast).permit(:heading, :body)
  end
end
