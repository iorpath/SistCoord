class OfertaCursosDetalleController < ApplicationController
  
  before_filter :authenticate_user!    
  def index
    #flash[:periodof] = params[:periodo]
    #flash[:materiaidf] = params[:materiaid]
    @fach = FachadaOfertaCursos.new
    @mapadetalle = @fach.darDetallesMateria(params[:materiaid].to_i, params[:periodo].to_i)
  end
end