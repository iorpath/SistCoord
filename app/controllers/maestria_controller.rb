class MaestriaController < ApplicationController
  # GET /maestria
  # GET /maestria.json
  def index
    @maestria = Maestrium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maestria }
    end
  end

  # GET /maestria/1
  # GET /maestria/1.json
  def show
    @maestrium = Maestrium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @maestrium }
    end
  end

  # GET /maestria/new
  # GET /maestria/new.json
  def new
    @maestrium = Maestrium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @maestrium }
    end
  end

  # GET /maestria/1/edit
  def edit
    @maestrium = Maestrium.find(params[:id])
  end

  # POST /maestria
  # POST /maestria.json
  def create
    @maestrium = Maestrium.new(params[:maestrium])

    respond_to do |format|
      if @maestrium.save
        format.html { redirect_to @maestrium, notice: 'Maestrium was successfully created.' }
        format.json { render json: @maestrium, status: :created, location: @maestrium }
      else
        format.html { render action: "new" }
        format.json { render json: @maestrium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /maestria/1
  # PUT /maestria/1.json
  def update
    @maestrium = Maestrium.find(params[:id])

    respond_to do |format|
      if @maestrium.update_attributes(params[:maestrium])
        format.html { redirect_to @maestrium, notice: 'Maestrium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @maestrium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maestria/1
  # DELETE /maestria/1.json
  def destroy
    @maestrium = Maestrium.find(params[:id])
    @maestrium.destroy

    respond_to do |format|
      format.html { redirect_to maestria_url }
      format.json { head :no_content }
    end
  end
end
