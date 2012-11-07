class LlenarEncuestaController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /llenarencusta
  # GET /llenarencusta.json
  def index
    #@pensumestudiante = EstudiantePensum.find(:first, :conditions => [ "estudiante_id = ? and estado = 'activo'", current_user.id])
    @usuarioactual = current_user
    @pensumestudiante = EstudiantePensum.find(:first, :conditions => [ "estudiante_id = 1 and estado = 'activo'"])
    #@pensumestudiante.id
  end
end