require "spec_helper"

describe MetroStationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/metro_stations").to route_to("metro_stations#index")
    end
  end
end
