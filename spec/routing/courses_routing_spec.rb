require 'spec_helper'

describe CoursesController do
  describe 'routing' do
    it 'routes to #index' do
      get('/courses').should route_to('courses#index')
    end

    it 'routes to #new' do
      get('/courses/new').should route_to('courses#new')
    end

    it 'routes to #create' do
      post('/courses').should route_to('courses#create')
    end

    it 'routes to #update_multiple' do
      put('/courses/update_multiple').should route_to('courses#update_multiple')
    end
  end
end

