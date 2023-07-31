# frozen_string_literal: true

class SuggestionsController < ApplicationController
  def index
    @suggestions = Suggestion.all.order(created_at: :desc)
  end

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(set_params)
    @suggestion.user_id = current_user.id

    if @suggestion.save
      redirect_to root_path, notice: 'Suggestion created successfully!'
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.permit(:suggestion_body)
  end
end
