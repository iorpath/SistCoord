class MateriasPeriodoController < ApplicationController
  def index
    @periodos = Periodo.all
  end
end
