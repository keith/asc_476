require 'spec_helper'

describe ReportsController do
  describe 'routing' do
    it 'routes to #index' do
      get('/reports').should route_to('reports#index')
    end
  end
end
