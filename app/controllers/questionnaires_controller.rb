class QuestionnairesController < ApplicationController
  before_filter :authenticate_admin, :only => [:index, :show, :destroy]
  before_filter :go_to_consent, :only => [:new, :create, :update]

  before_filter :load_questions
  
  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questionnaires }
    end
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
    @questionnaire = Questionnaire.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @questionnaire }
    end
  end

  # GET /questionnaires/new
  # GET /questionnaires/new.json
  def new
    @questionnaire = current_questionnaire || Questionnaire.new
    
    if @questionnaire.step > 13
      redirect_to goodbye_path
      return
    end
    respond_to do |format|
      format.html { render "questionnaires/steps/step#{@questionnaire.step}" }
      format.json { render json: @questionnaire }
    end
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = @participant.build_questionnaire(params[:questionnaire])
    @questionnaire.step = 1
    
    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to new_questionnaire_path }
        # format.json { render json: @questionnaire, status: :created, location: @questionnaire }
      else
        format.html { render "questionnaires/steps/step0" }
        # format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questionnaires/1
  # PUT /questionnaires/1.json
  def update
    @questionnaire = current_questionnaire
    @questionnaire.step += 1

    respond_to do |format|
      if @questionnaire.update_attributes(params[:questionnaire])
        format.html { redirect_to new_questionnaire_path }
        # format.json { head :no_content }
      else
        format.html { render "questionnaires/steps/step#{@questionnaire.step - 1}" }
        # format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.destroy

    respond_to do |format|
      format.html { redirect_to questionnaires_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def current_participant
    @participant = Participant.find_by_session_id(session[:session_id])
  end
  
  def current_questionnaire
    if @participant.nil?
      return nil
    else
      return @participant.questionnaire
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
    @question_texts = YAML.load_file("#{Rails.root.to_s}/lib/questionnaire_questions.yml")
  end
end
