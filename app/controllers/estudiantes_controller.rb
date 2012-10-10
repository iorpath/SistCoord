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
    @estudiante = Estudiante.find params[:id]
    @pensum = Pensum.find params[:id_pensum]
    @maestria = @pensum.maestrium
    
    @materias_por_semestre = []    
    8.times do |n|
    @materias_por_semestre <<  @pensum.materias_semestre_sugerido(n)
    end
    @materias_primero = @pensum.materias_semestre_sugerido 1
    @materias_segundo = @pensum.materias_semestre_sugerido 2
    @materias_tercero = @pensum.materias_semestre_sugerido 3
    @materias_cuarto = @pensum.materias_semestre_sugerido 4
    @materias_quinto = @pensum.materias_semestre_sugerido 5
    @materias_sexto = @pensum.materias_semestre_sugerido 6
    @materias_septimo = @pensum.materias_semestre_sugerido 7
    @materias_octavo = @pensum.materias_semestre_sugerido 8
  end
  
  def menu
     @estudiante = Estudiante.find params[:id]
  end
  
  def inscribir_maestria
    @estudiante = Estudiante.find params[:id]
  end
end
