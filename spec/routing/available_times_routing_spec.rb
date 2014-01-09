require "spec_helper"

describe AvailableTimesController do
  describe "routing" do

    it "routes to #index" do
      get("/available_times").should route_to("available_times#index")
    end

    it "routes to #new" do
      get("/available_times/new").should route_to("available_times#new")
    end

    it "routes to #show" do
      get("/available_times/1").should route_to("available_times#show", :id => "1")
    end

    it "routes to #edit" do
      get("/available_times/1/edit").should route_to("available_times#edit", :id => "1")
    end

    it "routes to #create" do
      post("/available_times").should route_to("available_times#create")
    end

    it "routes to #update" do
      put("/available_times/1").should route_to("available_times#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/available_times/1").should route_to("available_times#destroy", :id => "1")
    end

  end
end
