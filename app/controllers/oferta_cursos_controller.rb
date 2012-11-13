class OfertaCursosController < ApplicationController
  before_filter :authenticate_user!    
  def index
    @periodos = Periodo.all
    if(params[:persel] != nil) 
      @periodo_seleccionado = params[:persel]
    else
      @periodo_seleccionado = @periodos.first.id
    end
    
    if(params[:top] != nil) then
      @top_seleccionado = params[:top]
      #flash[:notice] = @top_seleccionado
    else
      @top_seleccionado = 0
    end
    @fach = FachadaOfertaCursos.new
    #flash[:notice] = "periodo " + @periodo_seleccionado.to_s + ". top " + @top_seleccionado.to_s + ". usuario " + current_user.id.to_s
    @mapamaterias = @fach.darMateriasPorMaestriaDeCoordinadorConTop(current_user.id,@top_seleccionado, @periodo_seleccionado.to_i)
    #flash[:estado] = @mapamaterias[2][8].estop.to_s
  end
  
  def create
   
  end
end
