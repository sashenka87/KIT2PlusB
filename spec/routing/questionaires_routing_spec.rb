require "spec_helper"

describe QuestionairesController do
  describe "routing" do

    it "routes to #index" do
      get("/questionaires").should route_to("questionaires#index")
    end

    it "routes to #new" do
      get("/questionaires/new").should route_to("questionaires#new")
    end

    it "routes to #show" do
      get("/questionaires/1").should route_to("questionaires#show", :id => "1")
    end

    # it "routes to #edit" do
    #   get("/questionaires/1/edit").should route_to("questionaires#edit", :id => "1")
    # end

    it "routes to #create" do
      post("/questionaires").should route_to("questionaires#create")
    end

    it "routes to #update" do
      put("/questionaires/1").should route_to("questionaires#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/questionaires/1").should route_to("questionaires#destroy", :id => "1")
    end

  end
end
