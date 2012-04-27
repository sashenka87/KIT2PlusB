class GraphicsController < ApplicationController
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
    @graphic = Graphic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @graphic }
    end
  end

  # GET /graphics/1/edit
  def edit
    @graphic = Graphic.find(params[:id])
  end

  # POST /graphics
  # POST /graphics.json
  def create
    @graphic = Graphic.new(params[:graphic])

    respond_to do |format|
      if @graphic.save
        format.html { redirect_to @graphic, notice: 'Graphic was successfully created.' }
        format.json { render json: @graphic, status: :created, location: @graphic }
      else
        format.html { render action: "new" }
        format.json { render json: @graphic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /graphics/1
  # PUT /graphics/1.json
  def update
    @graphic = Graphic.find(params[:id])

    respond_to do |format|
      if @graphic.update_attributes(params[:graphic])
        format.html { redirect_to @graphic, notice: 'Graphic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @graphic.errors, status: :unprocessable_entity }
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
end
