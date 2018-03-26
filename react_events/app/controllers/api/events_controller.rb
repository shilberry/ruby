module Api
    class EventsController < ApplicationController
        protect_from_forgery with: :null_session 
        
        def index
            render json: Event.all
        end

        def search
            query = params[:query]
            events = Event.where('name LIKE ? OR place LIKE ? OR description LIKE ?',
                "%#{query}%","%#{query}%","%#{query}%")
            render json: events
        end

        def create
            event = Event.new(event_params)
            if event.save
                render json: event
            else
                render nothing: true, status: :bad_request
            end
        end

        def event_params
            params.require(:event).permit(:name, :description, :event_data, :place)
        end

    end

end
