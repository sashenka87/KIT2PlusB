require 'spec_helper'

describe SourceEvaluationsController do

  describe "GET 'index'" do
    it "returns http success" do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{ENV["ADMIN_USER"]}:#{ENV["ADMIN_PASS"]}")
      get 'index'
      response.should be_success
    end
  end

end
