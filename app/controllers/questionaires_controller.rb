class QuestionairesController < ApplicationController
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
      format.html # show.html.erb
      format.json { render json: @questionaire }
    end
  end

  # GET /questionaires/new
  # GET /questionaires/new.json
  def new
    @questionaire = Questionaire.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questionaire }
    end
  end

  # GET /questionaires/1/edit
  def edit
    @questionaire = Questionaire.find(params[:id])
  end

  # POST /questionaires
  # POST /questionaires.json
  def create
    @questionaire = Questionaire.new(params[:questionaire])

    respond_to do |format|
      if @questionaire.save
        format.html { redirect_to @questionaire, notice: 'Questionaire was successfully created.' }
        format.json { render json: @questionaire, status: :created, location: @questionaire }
      else
        format.html { render action: "new" }
        format.json { render json: @questionaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questionaires/1
  # PUT /questionaires/1.json
  def update
    @questionaire = Questionaire.find(params[:id])

    respond_to do |format|
      if @questionaire.update_attributes(params[:questionaire])
        format.html { redirect_to @questionaire, notice: 'Questionaire was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questionaire.errors, status: :unprocessable_entity }
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
end
