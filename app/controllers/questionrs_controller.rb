class QuestionrsController < ApplicationController
  # GET /questionrs
  # GET /questionrs.json
  def index
    @questionrs = Questionr.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questionrs }
    end
  end

  # GET /questionrs/1
  # GET /questionrs/1.json
  def show
    @questionr = Questionr.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questionr }
    end
  end

  # GET /questionrs/new
  # GET /questionrs/new.json
  def new
    @questionr = Questionr.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questionr }
    end
  end

  # GET /questionrs/1/edit
  def edit
    @questionr = Questionr.find(params[:id])
  end

  # POST /questionrs
  # POST /questionrs.json
  def create
    @questionr = Questionr.new(params[:questionr])

    respond_to do |format|
      if @questionr.save
        format.html { redirect_to @questionr, notice: 'Questionr was successfully created.' }
        format.json { render json: @questionr, status: :created, location: @questionr }
      else
        format.html { render action: "new" }
        format.json { render json: @questionr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questionrs/1
  # PUT /questionrs/1.json
  def update
    @questionr = Questionr.find(params[:id])

    respond_to do |format|
      if @questionr.update_attributes(params[:questionr])
        format.html { redirect_to @questionr, notice: 'Questionr was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questionr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionrs/1
  # DELETE /questionrs/1.json
  def destroy
    @questionr = Questionr.find(params[:id])
    @questionr.destroy

    respond_to do |format|
      format.html { redirect_to questionrs_url }
      format.json { head :no_content }
    end
  end
end
