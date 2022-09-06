class EventsController < ApplicationController
    before_action :login, except: [:index, :show]

    def index
      @events = Event.all
    end

    def new
      @event = Event.new
    end

    def create
      #@event = Event.new
      #@user = @event.build_creator(event_params)
      @event = current_user.events.new(event_params)
  
      if @event.save
        redirect_to events_url
      else
        render :new, status: :unprocessable_entity
      end
    end
    #@author = @book.build_author(author_number: 123,
    #    author_name: "John Doe")

    def edit
      @event = Event.find(params[:id])
    end

    def update
      @event = Event.find(params[:id])

      if @event.update(event_params)
        redirect_to events_url
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def show
      @event = Event.find(params[:id])
      @attendance = @event.event_attendings
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
