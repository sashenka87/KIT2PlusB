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
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << ["id", "q0", "q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "q10", "q11", "q12", "q13", 
                  "q14", "q15", "q16", "q17", "q18", "q19", "q20", "q21", "q22", "q23", "q24", "q25", "q26", "q27", 
                  "q28", "q29", "q30", "q31", "q32", "q33", "q34", "q35", "q36", "q37", "q38", "q39", "q40", "q41", 
                  "q42", "q43", "q44", "q45", "q46", "q47", "q48", "q49", "q50", "q51", "q52", "q53", "q54", "q55", 
                  "q56", "q57", "q58", "q59", "q60", "q61", "q62", "q63", "q64", "q65", "q66", "q67", "q68", "q69", 
                  "q70", "q71", "q72", "q73", "q74", "q75", "q76", "q77", "q78", "q79", "q80", "q81", "q82", "q83", 
                  "q84", "q85", "context1", "context2", "created_at", "updated_at", "participant_id"]
          @questionnaires.each do |q|
            csv << [q.id, q.q0, q.q1, q.q2, q.q3, q.q4, q.q5, q.q6, q.q7, q.q8, q.q9, q.q10, q.q11, q.q12, q.q13, 
                    q.q14, q.q15, q.q16, q.q17, q.q18, q.q19, q.q20, q.q21, q.q22, q.q23, q.q24, q.q25, q.q26, q.q27, 
                    q.q28, q.q29, q.q30, q.q31, q.q32, q.q33, q.q34, q.q35, q.q36, q.q37, q.q38, q.q39, q.q40, q.q41, 
                    q.q42, q.q43, q.q44, q.q45, q.q46, q.q47, q.q48, q.q49, q.q50, q.q51, q.q52, q.q53, q.q54, q.q55, 
                    q.q56, q.q57, q.q58, q.q59, q.q60, q.q61, q.q62, q.q63, q.q64, q.q65, q.q66, q.q67, q.q68, q.q69, 
                    q.q70, q.q71, q.q72, q.q73, q.q74, q.q75, q.q76, q.q77, q.q78, q.q79, q.q80, q.q81, q.q82, q.q83, 
                    q.q84, q.q85, q.context1, q.context2, q.created_at, q.updated_at, q.participant_id]
          end
        end

        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present',
                              :disposition => "attachment; filename=questionnaires.csv"
      }
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
