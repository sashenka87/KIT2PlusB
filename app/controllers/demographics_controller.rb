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
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << ["ID", "participant_id", "gender", "age", "ethnicity", "major", "year_university", "gpa",
                  "country_of_residence", "country_of_birth", "country_of_schooling", "native_english",
                  "native_language", "created_at", "updated_at"]
          @demographics.each do |d|
            csv << [d.id, d.participant_id, d.gender, d.age, d.ethnicity, d.major, d.year_university, d.gpa, 
                    d.country_of_residence, d.country_of_birth, d.country_of_schooling, d.native_english, 
                    d.native_language, d.created_at, d.updated_at]
          end
        end

        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present',
                              :disposition => "attachment; filename=demographics.csv"
      }
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
    unless @participant.demographic.nil?
      redirect_to new_graphic_path
      return
    end
    
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
        format.html { redirect_to new_graphic_path }
        # format.json { render json: @demographic, status: :created, location: @demographic }
      else
        format.html { render action: "new" }
        # format.json { render json: @demographic.errors, status: :unprocessable_entity }
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
