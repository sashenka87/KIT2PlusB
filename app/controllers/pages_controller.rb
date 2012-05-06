class PagesController < ApplicationController
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
end
