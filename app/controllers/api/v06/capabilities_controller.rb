module Api
  module V06
    class CapabilitiesController < Api::CapabilitiesController
      # External apps that use the api are able to query the api to find out some
      # parameters of the API. It currently returns:
      # * minimum and maximum API versions that can be used.
      # * maximum area that can be requested in a bbox request in square degrees
      # * number of tracepoints that are returned in each tracepoints page
      def show
        @database_status = database_status
        @api_status = api_status
        @gpx_status = gpx_status
        @minimum_api_version = "0.6"
        @maximum_api_version = "0.6"
        @current_api_version = params[:api_version]
      end
    end
  end
end
