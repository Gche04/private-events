class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @events = @user.events
        @event_attended = @user.event_attendings
    end
end
#@fromcanada = User.where(:country => 'canada')