class PagesController < ApplicationController
  before_filter :authenticate_admin, :only => [:dashboard]
  
  def welcome
    if @progress
      redirect_to new_demographic_path
      return
    end
  end

  def goodbye
    if params[:decline].present?
      flash[:notice] = "We hope that you'll consider helping us with another study in the future."
    end
  end
  
  def dashboard
    
  end
  
  private
  
  def authenticate_admin
    authenticate_or_request_with_http_basic do |user, password|
      user == ENV["ADMIN_USER"] && password == ENV["ADMIN_PASS"]
    end
  end
end
