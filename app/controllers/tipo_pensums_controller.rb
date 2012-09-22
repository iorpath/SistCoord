class TipoPensumsController < ApplicationController
  # GET /tipo_pensums
  # GET /tipo_pensums.json
  def index
    @tipo_pensums = TipoPensum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_pensums }
    end
  end

  # GET /tipo_pensums/1
  # GET /tipo_pensums/1.json
  def show
    @tipo_pensum = TipoPensum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_pensum }
    end
  end

  # GET /tipo_pensums/new
  # GET /tipo_pensums/new.json
  def new
    @tipo_pensum = TipoPensum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_pensum }
    end
  end

  # GET /tipo_pensums/1/edit
  def edit
    @tipo_pensum = TipoPensum.find(params[:id])
  end

  # POST /tipo_pensums
  # POST /tipo_pensums.json
  def create
    @tipo_pensum = TipoPensum.new(params[:tipo_pensum])

    respond_to do |format|
      if @tipo_pensum.save
        format.html { redirect_to @tipo_pensum, notice: 'Tipo pensum was successfully created.' }
        format.json { render json: @tipo_pensum, status: :created, location: @tipo_pensum }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_pensum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_pensums/1
  # PUT /tipo_pensums/1.json
  def update
    @tipo_pensum = TipoPensum.find(params[:id])

    respond_to do |format|
      if @tipo_pensum.update_attributes(params[:tipo_pensum])
        format.html { redirect_to @tipo_pensum, notice: 'Tipo pensum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_pensum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_pensums/1
  # DELETE /tipo_pensums/1.json
  def destroy
    @tipo_pensum = TipoPensum.find(params[:id])
    @tipo_pensum.destroy

    respond_to do |format|
      format.html { redirect_to tipo_pensums_url }
      format.json { head :no_content }
    end
  end
end
