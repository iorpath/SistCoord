class EncuestaController < ApplicationController
  # GET /encuesta
  # GET /encuesta.json
  def index
    @encuesta = Encuestum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @encuesta }
    end
  end

  # GET /encuesta/1
  # GET /encuesta/1.json
  def show
    @encuestum = Encuestum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @encuestum }
    end
  end

  # GET /encuesta/new
  # GET /encuesta/new.json
  def new
    @encuestum = Encuestum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @encuestum }
    end
  end

  # GET /encuesta/1/edit
  def edit
    @encuestum = Encuestum.find(params[:id])
  end

  # POST /encuesta
  # POST /encuesta.json
  def create
    @encuestum = Encuestum.new(params[:encuestum])

    respond_to do |format|
      if @encuestum.save
        format.html { redirect_to @encuestum, notice: 'Encuestum was successfully created.' }
        format.json { render json: @encuestum, status: :created, location: @encuestum }
      else
        format.html { render action: "new" }
        format.json { render json: @encuestum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /encuesta/1
  # PUT /encuesta/1.json
  def update
    @encuestum = Encuestum.find(params[:id])

    respond_to do |format|
      if @encuestum.update_attributes(params[:encuestum])
        format.html { redirect_to @encuestum, notice: 'Encuestum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @encuestum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encuesta/1
  # DELETE /encuesta/1.json
  def destroy
    @encuestum = Encuestum.find(params[:id])
    @encuestum.destroy

    respond_to do |format|
      format.html { redirect_to encuesta_url }
      format.json { head :no_content }
    end
  end
end
