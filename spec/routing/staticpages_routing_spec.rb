require "spec_helper"

describe StaticpagesController do
  describe "routing" do

    it "routes to #index" do
      get("/staticpages").should route_to("staticpages#index")
    end

    it "routes to #new" do
      get("/staticpages/new").should route_to("staticpages#new")
    end

    it "routes to #show" do
      get("/staticpages/1").should route_to("staticpages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/staticpages/1/edit").should route_to("staticpages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/staticpages").should route_to("staticpages#create")
    end

    it "routes to #update" do
      put("/staticpages/1").should route_to("staticpages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/staticpages/1").should route_to("staticpages#destroy", :id => "1")
    end

  end
end
