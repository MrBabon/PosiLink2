class EventsController < ApplicationController
    def index
        @events = Event.all
        @markers = @events.geocoded.map do |event|
            map_view(event)
        end
    end
    
    def show
        @event = Event.find(params[:id])
        @participation = Participation.participation_for(current_user, @event)
        @marker = map_view(@event)
        authorize @event
    end
    
    private
    
    def map_view(event)
        {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {event: event})
        }
    end
end
