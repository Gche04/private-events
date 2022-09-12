class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @events = @user.events
        @event_attended = @user.event_attendings
        @invites = Invitation.where(invitee_id: @user.id)
    end
end
