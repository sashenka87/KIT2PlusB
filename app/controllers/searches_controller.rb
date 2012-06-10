class SearchesController < ApplicationController
  before_filter :authenticate_admin, :only => [:index, :nested_download, :show, :destroy]
  before_filter :go_to_consent, :only => [:new, :create, :update]

  # GET /searches
  # GET /searches.json
  def index
    @searches = Search.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searches }
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << ["id", "participant_id", "d_know_astro", "d_know_psyc", "t_know_astro", "t_know_psyc", "d_interest_astro",
                  "d_interest_psyc", "t_interest_astro", "t_interest_psyc", "confidence_discrete", "confidence_open", "answer_discrete",
                  "answer_open", "confidencewhy_discrete", "confidencewhy_open", "created_at", "updated_at", "ad_test"]
          @searches.each do |s|
            csv << [s.id, s.participant_id, s.d_know_astro, s.d_know_psyc, s.t_know_astro, s.t_know_psyc, s.d_interest_astro, 
                    s.d_interest_psyc, s.t_interest_astro, s.t_interest_psyc, s.confidence_discrete, s.confidence_open, s.answer_discrete, 
                    s.answer_open, s.confidencewhy_discrete, s.confidencewhy_open, s.created_at, s.updated_at, s.ad_test]
          end
        end

        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present',
                              :disposition => "attachment; filename=searches.csv"
      }
    end
  end
  
  def nested_download
    @searches = Search.all
    
    respond_to do |format|
      format.html { 
        flash[:error] = "Nested download only supports CSV"
        redirect_to searches_path 
      }
      format.csv {
        max_sources = SourceEvaluation.group([:search_id]).count.values.max
        
        csv_string = CSV.generate do |csv|
          temp = ["id", "participant_id", "d_know_astro", "d_know_psyc", "t_know_astro", "t_know_psyc", "d_interest_astro",
                  "d_interest_psyc", "t_interest_astro", "t_interest_psyc", "confidence_discrete", "confidence_open", "answer_discrete",
                  "answer_open", "confidencewhy_discrete", "confidencewhy_open", "created_at", "updated_at", "ad_test"]
          max_sources.times do |t|
            temp += ["source_evaluation_id_#{t}", "familiarity_#{t}", "utility_#{t}", "accessibility_#{t}", "trust_#{t}", "created_at#{t}", "updated_at#{t}", "source_id_#{t}", "time_spent_#{t}"]
          end
          
          csv << temp
          @searches.each do |s|
            temp = [s.id, s.participant_id, s.d_know_astro, s.d_know_psyc, s.t_know_astro, s.t_know_psyc, s.d_interest_astro, 
                    s.d_interest_psyc, s.t_interest_astro, s.t_interest_psyc, s.confidence_discrete, s.confidence_open, s.answer_discrete, 
                    s.answer_open, s.confidencewhy_discrete, s.confidencewhy_open, s.created_at, s.updated_at, s.ad_test]
            s.source_evaluations.each do |se|
              temp += [se.id, se.familiarity, se.utility, se.accessibility, se.trust, se.created_at, se.updated_at, se.source_id, se.time_spent]
            end
            csv << temp
          end
        end

        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present',
                              :disposition => "attachment; filename=searches_with_nested_sources.csv"
      }
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
    @search = current_search || @participant.create_search # so that I can accept nested attributes

    if @search.step > 5
      redirect_to new_questionnaire_path
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
