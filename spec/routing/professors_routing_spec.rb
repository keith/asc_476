require 'spec_helper'

describe ProfessorsController do
  describe 'routing' do
    it 'routes to #index' do
      get('/professors').should route_to('professors#index')
    end

    it 'routes to #show' do
      get('/professors/1').should route_to('professors#show', id: '1')
    end

    it 'routes to #edit' do
      get('/professors/1/edit').should route_to('professors#edit', id: '1')
    end

    it 'routes to #update' do
      put('/professors/1').should route_to('professors#update', id: '1')
    end

    it 'routes to #destroy' do
      delete('/professors/1').should route_to('professors#destroy', id: '1')
    end

    it 'routes to #email' do
      post('/professors/1/email').should route_to('professors#email', id: '1')
    end
  end
end
