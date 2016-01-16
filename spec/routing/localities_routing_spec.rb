require "spec_helper"

describe LocalitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/localities").to route_to("localities#index")
    end
  end
end
