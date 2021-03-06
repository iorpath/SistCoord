class EstudiantesController < ApplicationController
  # GET /estudiantes
  # GET /estudiantes.json
  def index
    @estudiantes = Estudiante.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @estudiantes }
    end
  end

  # GET /estudiantes/1
  # GET /estudiantes/1.json
  def show
    @estudiante = Estudiante.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @estudiante }
    end
  end

  # GET /estudiantes/new
  # GET /estudiantes/new.json
  def new
    @estudiante = Estudiante.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @estudiante }
    end
  end

  # GET /estudiantes/1/edit
  def edit
    @estudiante = Estudiante.find(params[:id])
  end

  # POST /estudiantes
  # POST /estudiantes.json
  def create
    @estudiante = Estudiante.new(params[:estudiante])
    respond_to do |format|
      if @estudiante.save
        format.html { redirect_to @estudiante, notice: 'El estudiante ha sido creado exitosamente' }
        format.json { render json: @estudiante, status: :created, location: @estudiante }
      else
        format.html { render action: "new" }
        format.json { render json: @estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /estudiantes/1
  # PUT /estudiantes/1.json
  def update
    @estudiante = Estudiante.find(params[:id])

    respond_to do |format|
      if params[:pensum_select][:pensum_id]
        pensum = Pensum.find(params[:pensum_select][:pensum_id])
      @estudiante.pensums << pensum
      end
      if @estudiante.update_attributes(params[:estudiante])
        format.html { redirect_to @estudiante, notice: 'La informacion del estudiante ha sido actualizada exitosamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estudiantes/1
  # DELETE /estudiantes/1.json
  def destroy
    @estudiante = Estudiante.find(params[:id])
    @estudiante.destroy

    respond_to do |format|
      format.html { redirect_to estudiantes_url }
      format.json { head :no_content }
    end
  end

  def maestrias
    @estudiante = User.find(params[:id]).estudiante
    if @estudiante.nil?
      @estudiante = Estudiante.find params[:id]
    end
    @maestrias_estudiante = @estudiante.pensums
  end

  def maestria
    @estudiante = User.find(params[:id]).estudiante
    if @estudiante.nil?
      @estudiante = Estudiante.find params[:id]
    end
    @pensum = Pensum.find params[:id_pensum]
    session[:pensum] = @pensum.id
    @maestria = @pensum.maestrium
    @materias = @pensum.dar_materias
  end

  def menu
    @estudiante = Estudiante.find params[:id]
  end

  def inscribir_maestria
    @estudiante = User.find(params[:id]).estudiante
    if @estudiante.nil?
      @estudiante = Estudiante.find params[:id]
    end
  end

  def carpeta
    @estudiante = User.find(params[:id]).estudiante
    if @estudiante.nil?
      @estudiante = Estudiante.find params[:id]
    end
    @carpeta = @estudiante.carpeta
    if not @carpeta.nil?
      @periodos = @carpeta.periodo_estudiante
    end
  end

  def planeacion
    if session[:periodo].nil?
      @periodo = Periodo.actual
      session[:periodo] = @periodo.id
    else
      @periodo = Periodo.find session[:periodo]
    end
    if session[:pensum].nil?
      @pensum = nil
    else
      @pensum = session[:pensum]
    end
    @estudiante = User.find(params[:id]).estudiante
    if @estudiante.nil?
      @estudiante = Estudiante.find params[:id]
    end
    @materias_planeadas = @estudiante.dar_materias_paneadas(@periodo)
    @materias_maestrias = FachadaOfertaCursos.dar_materias_maestrias
  end

  def planificar_materias
    @estudiante = User.find(params[:id]).estudiante
    if @estudiante.nil?
      @estudiante = Estudiante.find params[:id]
    end
  end

  def inscribir_materias
    @periodo = Periodo.find session[:periodo]
    @estudiante = User.find(params[:id]).estudiante
    if @estudiante.nil?
      @estudiante = Estudiante.find params[:id]
    end
    @materias=[]
    if not params[:materia_id].nil?
      params[:materia_id].each do|id|
        materia = Materium.find(id)
        @estudiante.inscribir_materia(materia,@periodo)
      end
      redirect_to estudiante_planeacion_path @estudiante
    end
  end
end
