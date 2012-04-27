class DemographicsController < ApplicationController
  before_filter :authenticate_admin, :only => [:index, :show, :destroy]
  before_filter :go_to_consent, :only => [:new, :create]

  # GET /demographics
  # GET /demographics.json
  def index
    @demographics = Demographic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @demographics }
    end
  end

  # GET /demographics/1
  # GET /demographics/1.json
  def show
    @demographic = Demographic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @demographic }
    end
  end

  # GET /demographics/new
  # GET /demographics/new.json
  def new
    @demographic = @participant.build_demographic

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @demographic }
    end
  end

  # POST /demographics
  # POST /demographics.json
  def create
    @demographic = @participant.build_demographic(params[:demographic])

    respond_to do |format|
      if @demographic.save
        format.html { redirect_to @demographic, notice: 'Demographic was successfully created.' }
        format.json { render json: @demographic, status: :created, location: @demographic }
      else
        format.html { render action: "new" }
        format.json { render json: @demographic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demographics/1
  # DELETE /demographics/1.json
  def destroy
    @demographic = Demographic.find(params[:id])
    @demographic.destroy

    respond_to do |format|
      format.html { redirect_to demographics_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def authenticate_admin
    authenticate_or_request_with_http_basic do |user, password|
      user == ENV["ADMIN_USER"] && password == ENV["ADMIN_PASS"]
    end
  end
  
  def go_to_consent
    @participant = Participant.find_by_session_id(session[:session_id])
    if @participant.nil?
      flash[:alert] = "Sorry we need you to consent first."
      redirect_to new_participant_path
    end
  end
end
