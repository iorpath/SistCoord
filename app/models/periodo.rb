class Periodo < ActiveRecord::Base
  attr_accessible :fecha_fin, :fecha_inicio, :nombre, :vigente
end
