class QuestionairesController < ApplicationController
  before_filter :authenticate_admin, :only => [:index, :show, :destroy]
  before_filter :go_to_consent, :only => [:new, :create, :update]

  before_filter :load_questions
  
  # GET /questionaires
  # GET /questionaires.json
  def index
    @questionaires = Questionaire.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questionaires }
    end
  end

  # GET /questionaires/1
  # GET /questionaires/1.json
  def show
    @questionaire = Questionaire.find(params[:id])

    respond_to do |format|
      format.html { render "questionaires/steps/step#{@questionaire.step}" }
      format.json { render json: @questionaire }
    end
  end

  # GET /questionaires/new
  # GET /questionaires/new.json
  def new
    @questionaire = current_questionaire || Questionaire.new
    
    if @questionaire.step > 13
      redirect_to goodbye_path
      return
    end
    respond_to do |format|
      format.html { render "questionaires/steps/step0" }
      format.json { render json: @questionaire }
    end
  end

  # POST /questionaires
  # POST /questionaires.json
  def create
    @questionaire = @participant.build_questionaire(params[:questionaire])
    @questionaire.step = 1
    
    respond_to do |format|
      if @questionaire.save
        format.html { redirect_to new_questionaire_path }
        # format.json { render json: @questionaire, status: :created, location: @questionaire }
      else
        format.html { render "questionaires/steps/step0" }
        # format.json { render json: @questionaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questionaires/1
  # PUT /questionaires/1.json
  def update
    @questionaire = current_questionaire
    @questionaire.step += 1

    respond_to do |format|
      if @questionaire.update_attributes(params[:questionaire])
        format.html { redirect_to new_questionaire_path }
        # format.json { head :no_content }
      else
        format.html { render "questionaires/steps/step#{@questionaire.step - 1}" }
        # format.json { render json: @questionaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionaires/1
  # DELETE /questionaires/1.json
  def destroy
    @questionaire = Questionaire.find(params[:id])
    @questionaire.destroy

    respond_to do |format|
      format.html { redirect_to questionaires_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def current_participant
    @participant = Participant.find_by_session_id(session[:session_id])
  end
  
  def current_questionaire
    if @participant.nil?
      return nil
    else
      return @participant.questionaire
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
    
    if @participant.search.nil?
      flash[:alert] = "Sorry we need you to complete the search task first"
      redirect_to new_search_path
    end
  end
  
  def load_questions
    @question_texts = YAML.load_file("#{Rails.root.to_s}/lib/questionaire_questions.yml")
  end
end
