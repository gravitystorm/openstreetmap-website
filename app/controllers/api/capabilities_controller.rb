module Api
  class CapabilitiesController < ApiController
    authorize_resource :class => false

    around_action :api_call_handle_error, :api_call_timeout

    # External apps that use the api are able to query the api to find out some
    # parameters of the API. It currently returns:
    # * minimum and maximum API versions that can be used.
    # * maximum area that can be requested in a bbox request in square degrees
    # * number of tracepoints that are returned in each tracepoints page
    def show
      @database_status = database_status
      @api_status = api_status
      @gpx_status = gpx_status
      @minimum_api_version = Settings.api_versions.min_by(&:to_f)
      @maximum_api_version = Settings.api_versions.max_by(&:to_f)
      @current_api_version = params[:api_version]
    end
  end
end
