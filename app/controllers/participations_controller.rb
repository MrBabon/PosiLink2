class ParticipationsController < ApplicationController
    before_action :set_event, only: [:create]
    before_action :set_participation, only: [:destroy]

    def show
    end

    def create
        @participation = Participation.new(event_params)
        @participation.user = current_user
        @participation.save
        redirect_to event_path(@event)
    end

    def destroy
        @event = Event.find(params[:event_id])
        @participation.destroy
        redirect_to event_path(@event)
        flash[:notice] = "Votre inscription a été supprimée avec succès."
    end
    private

    def event_params
        params.require(:event).permit(:event_id)
    end

    def set_participation
        @participation = Participation.find(params[:id])
    end

    def set_event
        @event = Event.find(event_params[:event_id])
    end
end
