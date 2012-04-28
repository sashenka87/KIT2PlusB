class GraphicsController < ApplicationController
  before_filter :authenticate_admin, :only => [:index, :show, :destroy]
  before_filter :go_to_consent, :only => [:new, :create, :update]
  
  # GET /graphics
  # GET /graphics.json
  def index
    @graphics = Graphic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @graphics }
    end
  end

  # GET /graphics/1
  # GET /graphics/1.json
  def show
    @graphic = Graphic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @graphic }
    end
  end

  # GET /graphics/new
  # GET /graphics/new.json
  def new    
    @graphic = current_graphic || Graphic.new

    if @graphic.step > 7
      redirect_to new_search_path
      return
    end

    respond_to do |format|
      format.html { render "graphics/steps/step#{@graphic.step}" }
      format.json { render json: @graphic }
    end
  end

  # POST /graphics
  # POST /graphics.json
  def create
    @graphic = current_participant.build_graphic(params[:graphic])
    @graphic.step = 1

    respond_to do |format|
      if @graphic.save
        format.html { redirect_to new_graphic_path }
        # format.json { render json: @graphic, status: :created, location: @graphic }
      else
        format.html { render "graphics/steps/step0" }
        # format.json { render json: @graphic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /graphics/1
  # PUT /graphics/1.json
  def update
    @graphic = current_graphic
    @graphic.step += 1

    respond_to do |format|
      if @graphic.update_attributes(params[:graphic])
        format.html { redirect_to new_graphic_path }
        # format.json { head :no_content }
      else
        format.html { render "graphics/steps/step#{@graphic.step - 1}" }
        # format.json { render json: @graphic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graphics/1
  # DELETE /graphics/1.json
  def destroy
    @graphic = Graphic.find(params[:id])
    @graphic.destroy

    respond_to do |format|
      format.html { redirect_to graphics_url }
      format.json { head :no_content }
    end
  end
  
  private 
  
  def current_participant
    @participant = Participant.find_by_session_id(session[:session_id])
  end
  
  def current_graphic
    if @participant.nil?
      return nil
    else
      return @participant.graphic
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
    end
    
    if @participant.demographic.nil?
      flash[:alert] = "Sorry we need your demographic info first."
      redirect_to new_demographic_path
    end
  end
end
