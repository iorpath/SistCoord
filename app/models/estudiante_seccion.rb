class EstudianteSeccion < ActiveRecord::Base
  belongs_to :estudiante
  belongs_to :seccion
  attr_accessible :estado, :periodo
end
