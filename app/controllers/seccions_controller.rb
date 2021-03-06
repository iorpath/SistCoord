class SeccionsController < ApplicationController
  # GET /seccions
  # GET /seccions.json
  def index
    @seccions = Seccion.all
    @seccions.each do |seccion|
      seccion.materium = Materium.find(seccion.materium_id)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seccions }
    end
  end

  # GET /seccions/1
  # GET /seccions/1.json
  def show
    @seccion = Seccion.find(params[:id])
    @seccion.materium = Materium.find(@seccion.materium_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seccion }
    end
  end

  # GET /seccions/new
  # GET /seccions/new.json
  def new
    @seccion = Seccion.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seccion }
    end
  end

  # GET /seccions/1/edit
  def edit
    @seccion = Seccion.find(params[:id])
  end

  # POST /seccions
  # POST /seccions.json
  def create
    @seccion = Seccion.new(params[:seccion])

    respond_to do |format|
      if @seccion.save
        format.html { redirect_to @seccion, notice: 'Seccion creada exitosamente.' }
        format.json { render json: @seccion, status: :created, location: @seccion }
      else
        format.html { render action: "new" }
        format.json { render json: @seccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seccions/1
  # PUT /seccions/1.json
  def update
    @seccion = Seccion.find(params[:id])

    respond_to do |format|
      if @seccion.update_attributes(params[:seccion])
        format.html { redirect_to @seccion, notice: 'Seccion actualizada correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seccions/1
  # DELETE /seccions/1.json
  def destroy
    @seccion = Seccion.find(params[:id])
    @seccion.destroy

    respond_to do |format|
      format.html { redirect_to seccions_url }
      format.json { head :no_content }
    end
  end
end
