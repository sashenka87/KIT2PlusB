require 'spec_helper'

describe PagesController do

  describe "GET 'welcome'" do
    it "returns http success" do
      get 'welcome'
      response.should be_success
    end
  end

  describe "GET 'goodbye'" do
    it "returns http success" do
      get 'goodbye'
      response.should be_success
    end
  end
  
  describe "GET 'dashboard'" do
    it "returns http success" do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{ENV["ADMIN_USER"]}:#{ENV["ADMIN_PASS"]}")
      get 'dashboard'
      response.should be_success
    end
  end

end
