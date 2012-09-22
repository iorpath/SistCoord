class HomologacionsController < ApplicationController
  # GET /homologacions
  # GET /homologacions.json
  def index
    @homologacions = Homologacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @homologacions }
    end
  end

  # GET /homologacions/1
  # GET /homologacions/1.json
  def show
    @homologacion = Homologacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @homologacion }
    end
  end

  # GET /homologacions/new
  # GET /homologacions/new.json
  def new
    @homologacion = Homologacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @homologacion }
    end
  end

  # GET /homologacions/1/edit
  def edit
    @homologacion = Homologacion.find(params[:id])
  end

  # POST /homologacions
  # POST /homologacions.json
  def create
    @homologacion = Homologacion.new(params[:homologacion])

    respond_to do |format|
      if @homologacion.save
        format.html { redirect_to @homologacion, notice: 'Homologacion was successfully created.' }
        format.json { render json: @homologacion, status: :created, location: @homologacion }
      else
        format.html { render action: "new" }
        format.json { render json: @homologacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /homologacions/1
  # PUT /homologacions/1.json
  def update
    @homologacion = Homologacion.find(params[:id])

    respond_to do |format|
      if @homologacion.update_attributes(params[:homologacion])
        format.html { redirect_to @homologacion, notice: 'Homologacion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @homologacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homologacions/1
  # DELETE /homologacions/1.json
  def destroy
    @homologacion = Homologacion.find(params[:id])
    @homologacion.destroy

    respond_to do |format|
      format.html { redirect_to homologacions_url }
      format.json { head :no_content }
    end
  end
end
