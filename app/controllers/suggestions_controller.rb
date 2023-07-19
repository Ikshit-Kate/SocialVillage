class SuggestionsController < ApplicationController

    def index
        @suggestions = Suggestion.all
    end

    def new
        @suggestion = Suggestion.new
    end

    def create
        @suggestion = Suggestion.new(set_params)
        @suggestion.user_id = current_user.id
    
        if @suggestion.save
          # Handle successful save
          redirect_to root_path, notice: "Suggestion created successfully!"
        else
          # Handle failed save
          render :new # You might need to create a new.html.erb view for the "new" action
        end
      end

    private
    def set_params
        params.permit(:suggestion_body)
        
    end
end
