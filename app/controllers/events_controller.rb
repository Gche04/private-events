class EventsController < ApplicationController
    before_action :login, except: [:index, :show]

    def index
      @past_events = Event.past
      @upcoming_events = Event.upcoming
    end

    def new
      @event = Event.new
    end

    def create
      @event = current_user.events.new(event_params)
  
      if @event.save
        redirect_to events_url, notice: "event created"
      else
        flash[:error] = @event.errors.full_messages
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @event = Event.find(params[:id])
    end

    def update
      @event = Event.find(params[:id])

      if @event.update(event_params)
        redirect_to event_path, notice: "event edited"
      else
        flash[:error] = @event.errors.full_messages
        render :edit, status: :unprocessable_entity
      end
    end

    def show
      @event = Event.find(params[:id])
      @attendance = @event.event_attendings
    end

    def destroy
      @event = Event.find(params[:id])
      @event.destroy

      redirect_to events_url, status: :see_other, notice: "event deleted"
    end
    
    private

    def event_params
      params.require(:event).permit(:location, :event, :event_date, :event_time, :user_id)
    end

    def login
      unless user_signed_in?
        flash[:error] = "signed in to create event"
        redirect_to new_user_session_url
      end
    end
end
