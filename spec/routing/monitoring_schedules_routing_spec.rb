require "rails_helper"

RSpec.describe MonitoringSchedulesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/monitoring_schedules").to route_to("monitoring_schedules#index")
    end

    it "routes to #show" do
      expect(get: "/monitoring_schedules/1").to route_to("monitoring_schedules#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/monitoring_schedules").to route_to("monitoring_schedules#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/monitoring_schedules/1").to route_to("monitoring_schedules#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/monitoring_schedules/1").to route_to("monitoring_schedules#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/monitoring_schedules/1").to route_to("monitoring_schedules#destroy", id: "1")
    end
  end
end
