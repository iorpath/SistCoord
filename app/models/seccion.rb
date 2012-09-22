class Seccion < ActiveRecord::Base
  belongs_to :materia
  attr_accessible :etiqueta, :profesor, :salon
end
