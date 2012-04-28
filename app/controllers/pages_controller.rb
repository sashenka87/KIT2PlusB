class PagesController < ApplicationController
  def welcome
  end

  def goodbye
    if params[:decline].present?
      flash[:notice] = "We hope that you'll consider helping us with another study in the future."
    end
  end
end
