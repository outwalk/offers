require "spec_helper"

describe DistrictsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/districts").to route_to("districts#index")
    end
  end
end
