require "test_helper"

module Api
  class CapabilitiesControllerTest < ActionController::TestCase
    ##
    # test all routes which lead to this controller
    def test_routes
      assert_routing(
        { :path => "/api/capabilities", :method => :get },
        { :controller => "api/capabilities", :action => "show", :api_version => "0.6" }
      )

      ["0.6", "0.7"].each do |version|
        assert_recognizes(
          { :controller => "api/capabilities", :action => "show", :api_version => version },
          { :path => "/api/#{version}/capabilities", :method => :get }
        )
      end
    end

    def test_capabilities
      get :show, :params => { :api_version => "0.6" }
      assert_response :success
      assert_select "osm[version='0.6'][generator='#{GENERATOR}']", :count => 1 do
        assert_select "api", :count => 1 do
          assert_select "version[minimum='0.6'][maximum='0.7']", :count => 1
          assert_select "area[maximum='#{MAX_REQUEST_AREA}']", :count => 1
          assert_select "note_area[maximum='#{MAX_NOTE_REQUEST_AREA}']", :count => 1
          assert_select "tracepoints[per_page='#{TRACEPOINTS_PER_PAGE}']", :count => 1
          assert_select "changesets[maximum_elements='#{Changeset::MAX_ELEMENTS}']", :count => 1
          assert_select "status[database='online']", :count => 1
          assert_select "status[api='online']", :count => 1
          assert_select "status[gpx='online']", :count => 1
        end
      end
    end
  end
end
