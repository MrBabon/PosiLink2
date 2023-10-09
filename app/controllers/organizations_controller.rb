class OrganizationsController < ApplicationController
    def index
        if params[:query].present?
            @organizations = Organization.search_by_organization(params[:query])
        else
            @organizations = Organization.all
        end
        params[:query] = ""
        @filtered_organizations = policy_scope(Organization)
    end

    def show
        @organization = Organization.find(params[:id])
        @events = @organization.events
        @markers = @events.geocoded.map do |event|
          {
            lat: event.latitude,
            lng: event.longitude,
            info_window_html: render_to_string(partial: "info_window", locals: {event: event})
          }
        end
        authorize @organization
    end

    private

    def organization_params
      params.require(:organization).permit(:name, :address, :phone, :description, :avatar)
    end
end
