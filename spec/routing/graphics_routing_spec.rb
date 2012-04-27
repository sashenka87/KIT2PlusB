require "spec_helper"

describe GraphicsController do
  describe "routing" do

    it "routes to #index" do
      get("/graphics").should route_to("graphics#index")
    end

    it "routes to #new" do
      get("/graphics/new").should route_to("graphics#new")
    end

    it "routes to #show" do
      get("/graphics/1").should route_to("graphics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/graphics/1/edit").should route_to("graphics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/graphics").should route_to("graphics#create")
    end

    it "routes to #update" do
      put("/graphics/1").should route_to("graphics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/graphics/1").should route_to("graphics#destroy", :id => "1")
    end

  end
end
