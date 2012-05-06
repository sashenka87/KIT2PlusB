require "spec_helper"

describe QuestionnairesController do
  describe "routing" do

    it "routes to #index" do
      get("/questionnaires").should route_to("questionnaires#index")
    end

    it "routes to #new" do
      get("/questionnaires/new").should route_to("questionnaires#new")
    end

    it "routes to #show" do
      get("/questionnaires/1").should route_to("questionnaires#show", :id => "1")
    end

    # it "routes to #edit" do
    #   get("/questionnaires/1/edit").should route_to("questionnaires#edit", :id => "1")
    # end

    it "routes to #create" do
      post("/questionnaires").should route_to("questionnaires#create")
    end

    it "routes to #update" do
      put("/questionnaires/1").should route_to("questionnaires#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/questionnaires/1").should route_to("questionnaires#destroy", :id => "1")
    end

  end
end
