class SuggestionsController < ApplicationController
    def new
        @suggestion = Suggestion.new
    end

    def create
        @suggestion = Suggestion.new(set_params)
        @suggestion.user_id = current_user.id
        if @suggestion.save
            redirect_to root_path
        else
            flash.alert = "Suggestion not saved"
        end
    end

    private
    def set_params
        params.permit(:suggestion_body)
    end

    

end
