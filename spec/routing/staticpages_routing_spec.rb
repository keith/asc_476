require 'spec_helper'

describe StaticpagesController do
  describe 'routing' do
    it 'routes to #thanks' do
      get('/thankyou').should route_to('staticpages#thanks')
    end
  end
end
