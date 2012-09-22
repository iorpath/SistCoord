class MateriaController < ApplicationController
  # GET /materia
  # GET /materia.json
  def index
    @materia = Materium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @materia }
    end
  end

  # GET /materia/1
  # GET /materia/1.json
  def show
    @materium = Materium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @materium }
    end
  end

  # GET /materia/new
  # GET /materia/new.json
  def new
    @materium = Materium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @materium }
    end
  end

  # GET /materia/1/edit
  def edit
    @materium = Materium.find(params[:id])
  end

  # POST /materia
  # POST /materia.json
  def create
    @materium = Materium.new(params[:materium])

    respond_to do |format|
      if @materium.save
        format.html { redirect_to @materium, notice: 'Materium was successfully created.' }
        format.json { render json: @materium, status: :created, location: @materium }
      else
        format.html { render action: "new" }
        format.json { render json: @materium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /materia/1
  # PUT /materia/1.json
  def update
    @materium = Materium.find(params[:id])

    respond_to do |format|
      if @materium.update_attributes(params[:materium])
        format.html { redirect_to @materium, notice: 'Materium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @materium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materia/1
  # DELETE /materia/1.json
  def destroy
    @materium = Materium.find(params[:id])
    @materium.destroy

    respond_to do |format|
      format.html { redirect_to materia_url }
      format.json { head :no_content }
    end
  end
end
