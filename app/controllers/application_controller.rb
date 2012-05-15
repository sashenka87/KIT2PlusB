require "csv"

class ApplicationController < ActionController::Base
  before_filter :add_progress
  protect_from_forgery
  
  def add_progress
    @progress = nil
    participant = Participant.find_by_session_id(session[:session_id])
    unless participant.nil?
      @progress = participant.progress
    end
  end
end
