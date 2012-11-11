class MateriasPeriodoController < ApplicationController
    before_filter :authenticate_user!    
  def index
    @periodos = Periodo.all
    #@fach = FachadaOfertaCursos.new
    #@mapamaterias = @fach.darMateriasPorMaestriaDeCoordinadorConTop(current_user.id, :)
  end
end
