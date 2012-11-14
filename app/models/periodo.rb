class Periodo < ActiveRecord::Base
  attr_accessible :fecha_fin, :fecha_inicio, :nombre, :vigente
  
  def self.actual
    result =  Periodo.where :vigente=>true
    periodo = result.last
    return periodo
  end
end
