class SourceEvaluationsController < ApplicationController
  before_filter :authenticate_admin
  
  def index
    @source_evaluations = SourceEvaluation.all

    respond_to do |format|
      format.html
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << ["Id", "search_id", "familiarity", "utility", "accessibility", "trust", "created_at", "updated_at", "source_id", "time_spent"]
          @source_evaluations.each do |source|
            csv << [source.id, source.search_id, source.familiarity, source.utility, source.accessibility, source.trust, 
              source.created_at, source.updated_at, source.source_id, source.time_spent]
          end
        end

        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present',
                              :disposition => "attachment; filename=source_evaluations.csv"
      }
    end
  end

  private 
  
  def authenticate_admin
    authenticate_or_request_with_http_basic do |user, password|
      user == ENV["ADMIN_USER"] && password == ENV["ADMIN_PASS"]
    end
  end
end
