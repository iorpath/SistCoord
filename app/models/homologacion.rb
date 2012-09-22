class Homologacion < ActiveRecord::Base
  belongs_to :materia
  belongs_to :estudiante
  attr_accessible :estado, :materiaorigen, :materia, :estudiante, :observaciones
end
