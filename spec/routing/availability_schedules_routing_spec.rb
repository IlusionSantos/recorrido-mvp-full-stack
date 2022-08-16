require "rails_helper"

RSpec.describe AvailabilitySchedulesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/availability_schedules").to route_to("availability_schedules#index")
    end

    it "routes to #show" do
      expect(get: "/availability_schedules/1").to route_to("availability_schedules#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/availability_schedules").to route_to("availability_schedules#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/availability_schedules/1").to route_to("availability_schedules#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/availability_schedules/1").to route_to("availability_schedules#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/availability_schedules/1").to route_to("availability_schedules#destroy", id: "1")
    end
  end
end
