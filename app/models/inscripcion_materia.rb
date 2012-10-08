class InscripcionMateria < ActiveRecord::Base
  belongs_to :estudiante
  belongs_to :materium
  attr_accessible :estado, :periodo, :seccion, :estudiante, :materium
end
