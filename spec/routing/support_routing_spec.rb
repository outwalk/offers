require 'spec_helper'

describe SupportController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/support').to route_to('support#index')
    end

    it 'routes to #show' do
      expect(get: '/support/terms').to route_to('support#show', slug: 'terms')
    end
  end
end
