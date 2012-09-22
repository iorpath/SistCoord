class MateriaTipoPensumsController < ApplicationController
  # GET /materia_tipo_pensums
  # GET /materia_tipo_pensums.json
  def index
    @materia_tipo_pensums = MateriaTipoPensum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @materia_tipo_pensums }
    end
  end

  # GET /materia_tipo_pensums/1
  # GET /materia_tipo_pensums/1.json
  def show
    @materia_tipo_pensum = MateriaTipoPensum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @materia_tipo_pensum }
    end
  end

  # GET /materia_tipo_pensums/new
  # GET /materia_tipo_pensums/new.json
  def new
    @materia_tipo_pensum = MateriaTipoPensum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @materia_tipo_pensum }
    end
  end

  # GET /materia_tipo_pensums/1/edit
  def edit
    @materia_tipo_pensum = MateriaTipoPensum.find(params[:id])
  end

  # POST /materia_tipo_pensums
  # POST /materia_tipo_pensums.json
  def create
    @materia_tipo_pensum = MateriaTipoPensum.new(params[:materia_tipo_pensum])

    respond_to do |format|
      if @materia_tipo_pensum.save
        format.html { redirect_to @materia_tipo_pensum, notice: 'Materia tipo pensum was successfully created.' }
        format.json { render json: @materia_tipo_pensum, status: :created, location: @materia_tipo_pensum }
      else
        format.html { render action: "new" }
        format.json { render json: @materia_tipo_pensum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /materia_tipo_pensums/1
  # PUT /materia_tipo_pensums/1.json
  def update
    @materia_tipo_pensum = MateriaTipoPensum.find(params[:id])

    respond_to do |format|
      if @materia_tipo_pensum.update_attributes(params[:materia_tipo_pensum])
        format.html { redirect_to @materia_tipo_pensum, notice: 'Materia tipo pensum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @materia_tipo_pensum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materia_tipo_pensums/1
  # DELETE /materia_tipo_pensums/1.json
  def destroy
    @materia_tipo_pensum = MateriaTipoPensum.find(params[:id])
    @materia_tipo_pensum.destroy

    respond_to do |format|
      format.html { redirect_to materia_tipo_pensums_url }
      format.json { head :no_content }
    end
  end
end
