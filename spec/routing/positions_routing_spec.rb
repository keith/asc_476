require 'spec_helper'

describe PositionsController do
  describe 'routing' do
    it 'routes to #show' do
      get('/positions/1').should route_to('positions#show', :id => '1')
    end

    it 'routes to #edit' do
      get('/positions/1/edit').should route_to('positions#edit', :id => '1')
    end

    it 'routes to #update' do
      put('/positions/1').should route_to('positions#update', :id => '1')
    end
  end
end
