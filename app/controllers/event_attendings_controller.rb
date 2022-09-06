class EventAttendingsController < ApplicationController

    #def new
    #    @event_attending = EventAttending.new
    #end

    def create
        #event = Event.find(params[:id])
        @event_attending = EventAttending.new#(params[:attended_event_id])
        #@event_attending = current_user.event_attendings.new(event_attending_params)
        @event_attending.attended_event_id = params[:attended_event_id]
        @event_attending.attendee_id = params[:attendee_id]

        if @event_attending.save
            redirect_to events_url
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @event_attending = EventAttending.find(params[:id])
        @event_attending.destroy
    
        redirect_to events_url, status: :see_other
      end

    private

    #def event_attending_params
    #    params.require(:event_attending).permit(:attended_event_id, :attendee_id)
    #end

    def login
        unless user_signed_in?
          flash[:error] = "signed in to attend event"
          redirect_to new_user_session_url
        end
    end
end
