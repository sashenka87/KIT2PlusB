class SearchesController < ApplicationController
  before_filter :authenticate_admin, :only => [:index, :show, :destroy]
  before_filter :go_to_consent, :only => [:new, :create, :update]

  # GET /searches
  # GET /searches.json
  def index
    @searches = Search.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searches }
    end
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    @search = Search.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search }
    end
  end

  # GET /searches/new
  # GET /searches/new.json
  def new
    @search = current_search || @participant.create_search

    if @search.step > 5
      redirect_to goodbye_path
      return
    end

    respond_to do |format|
      format.html { render "searches/steps/step#{@search.step}" }
      format.json { render json: @search }
    end
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = @participant.build_search(params[:search])
    @search.step = 1

    respond_to do |format|
      if @search.save
        format.html { redirect_to new_search_path }
        # format.json { render json: @search, status: :created, location: @search }
      else
        format.html { render "searches/steps/step0" }
        # format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /searches/1
  # PUT /searches/1.json
  def update
    @search = current_search
    @search.step += 1

    respond_to do |format|
      if @search.update_attributes(params[:search])
        format.html { redirect_to new_search_path }
        # format.json { head :no_content }
      else
        format.html { render "searches/steps/step#{@search.step - 1}" }
        # format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search = Search.find(params[:id])
    @search.destroy

    respond_to do |format|
      format.html { redirect_to searches_url }
      format.json { head :no_content }
    end
  end
  
  private 
  
  def current_participant
    @participant = Participant.find_by_session_id(session[:session_id])
  end
  
  def current_search
    if @participant.nil?
      return nil
    else
      return @participant.search
    end
  end
    
  def authenticate_admin
    authenticate_or_request_with_http_basic do |user, password|
      user == ENV["ADMIN_USER"] && password == ENV["ADMIN_PASS"]
    end
  end
  
  def go_to_consent
    current_participant
    if @participant.nil?
      flash[:alert] = "Sorry we need you to consent first."
      redirect_to new_participant_path
      return
    end
    
    if @participant.demographic.nil?
      flash[:alert] = "Sorry we need your demographic info first."
      redirect_to new_demographic_path
      return
    end
    
    if @participant.graphic.nil?
      flash[:alert] = "Sorry we need you to complete the graphics task first."
      redirect_to new_graphic_path
      return
    end
  end
end
