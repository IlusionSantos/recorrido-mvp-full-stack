require "rails_helper"

RSpec.describe ContratsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/contrats").to route_to("contrats#index")
    end

    it "routes to #show" do
      expect(get: "/contrats/1").to route_to("contrats#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/contrats").to route_to("contrats#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/contrats/1").to route_to("contrats#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/contrats/1").to route_to("contrats#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/contrats/1").to route_to("contrats#destroy", id: "1")
    end
  end
end
