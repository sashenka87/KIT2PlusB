class ParticipantsController < ApplicationController
  before_filter :authenticate_admin, :only => [:index, :show, :destroy]

  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @participants }
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << ["ID","ip_address", "first_name", "last_name", "instructor", "country", "created_at", "updated_at"]
          @participants.each do |p|
            csv << [p.id, p.ip_address, p.first_name, p.last_name, p.instructor, p.country, p.created_at, p.updated_at]
          end
        end

        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present',
                              :disposition => "attachment; filename=participants.csv"
      }
    end
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
    @participant = Participant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @participant }
    end
  end

  # GET /participants/new
  # GET /participants/new.json
  def new
    p = Participant.find_by_session_id(session[:session_id])
    unless p.nil?
      redirect_to new_demographic_path
      return
    end
    
    @participant = Participant.new
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(params[:participant])
    @participant.session_id = session[:session_id]
    @participant.ip_address = request.ip

    respond_to do |format|
      if @participant.save
        format.html { redirect_to new_demographic_path }
      else
        format.html { render action: "new" }
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to participants_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def authenticate_admin
    authenticate_or_request_with_http_basic do |user, password|
      user == ENV["ADMIN_USER"] && password == ENV["ADMIN_PASS"]
    end
  end
end
