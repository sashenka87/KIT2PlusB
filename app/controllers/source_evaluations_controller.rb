class SourceEvaluationsController < ApplicationController
  before_filter :authenticate_admin
  
  def index
    @source_evaluations = SourceEvaluation.all
  end

  private 
  
  def authenticate_admin
    authenticate_or_request_with_http_basic do |user, password|
      user == ENV["ADMIN_USER"] && password == ENV["ADMIN_PASS"]
    end
  end
end
