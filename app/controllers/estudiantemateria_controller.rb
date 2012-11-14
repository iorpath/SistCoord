class EstudiantemateriaController < ApplicationController
  # GET /estudiantemateria
  # GET /estudiantemateria.json
  def index
    @estudiantemateria = Estudiantematerium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @estudiantemateria }
    end
  end

  # GET /estudiantemateria/1
  # GET /estudiantemateria/1.json
  def show
    @estudiantematerium = Estudiantematerium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @estudiantematerium }
    end
  end

  # GET /estudiantemateria/new
  # GET /estudiantemateria/new.json
  def new
    @estudiantematerium = Estudiantematerium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @estudiantematerium }
    end
  end

  # GET /estudiantemateria/1/edit
  def edit
    @estudiantematerium = Estudiantematerium.find(params[:id])
  end

  # POST /estudiantemateria
  # POST /estudiantemateria.json
  def create
    @estudiantematerium = Estudiantematerium.new(params[:estudiantematerium])

    respond_to do |format|
      if @estudiantematerium.save
        format.html { redirect_to @estudiantematerium, notice: 'Estudiantematerium was successfully created.' }
        format.json { render json: @estudiantematerium, status: :created, location: @estudiantematerium }
      else
        format.html { render action: "new" }
        format.json { render json: @estudiantematerium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /estudiantemateria/1
  # PUT /estudiantemateria/1.json
  def update
    @estudiantematerium = Estudiantematerium.find(params[:id])

    respond_to do |format|
      if @estudiantematerium.update_attributes(params[:estudiantematerium])
        format.html { redirect_to @estudiantematerium, notice: 'Estudiantematerium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @estudiantematerium.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @estudiantematerium = Estudiantematerium.find(params[:id])
    @estudiantematerium.destroy
    @estudiante = Estudiante.find(params[:estudiante_id])
    respond_to do |format|
      format.html { redirect_to estudiante_planeacion_url(@estudiante) }
      format.json { head :no_content }
    end
  end
end
