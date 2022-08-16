require "rails_helper"

RSpec.describe MonitoringServicesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/monitoring_services").to route_to("monitoring_services#index")
    end

    it "routes to #show" do
      expect(get: "/monitoring_services/1").to route_to("monitoring_services#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/monitoring_services").to route_to("monitoring_services#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/monitoring_services/1").to route_to("monitoring_services#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/monitoring_services/1").to route_to("monitoring_services#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/monitoring_services/1").to route_to("monitoring_services#destroy", id: "1")
    end
  end
end
