require "spec_helper"

describe DemographicsController do
  describe "routing" do

    it "routes to #index" do
      get("/demographics").should route_to("demographics#index")
    end

    it "routes to #new" do
      get("/demographics/new").should route_to("demographics#new")
    end

    it "routes to #show" do
      get("/demographics/1").should route_to("demographics#show", :id => "1")
    end

    # it "routes to #edit" do
    #   get("/demographics/1/edit").should route_to("demographics#edit", :id => "1")
    # end

    it "routes to #create" do
      post("/demographics").should route_to("demographics#create")
    end

    # it "routes to #update" do
    #   put("/demographics/1").should route_to("demographics#update", :id => "1")
    # end

    it "routes to #destroy" do
      delete("/demographics/1").should route_to("demographics#destroy", :id => "1")
    end

  end
end
