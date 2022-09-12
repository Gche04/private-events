class EventAttendingsController < ApplicationController
    before_action :login

    def create
        @event_attending = EventAttending.new
        @event_attending.attended_event_id = params[:attended_event_id]
        @event_attending.attendee_id = params[:attendee_id]

        if @event_attending.save
            redirect_to event_path(@event_attending.attended_event_id), notice: "attending #{@event_attending.attended_event.event}"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @event_attending = EventAttending.find(params[:id])
        @event_attending.destroy
    
        redirect_to events_url, status: :see_other, notice: "not attending #{@event_attending.attended_event.event}"
    end

    private

    def login
        unless user_signed_in?
          flash[:error] = "signed in to attend event"
          redirect_to new_user_session_url
        end
    end
end
