class PeriodoEstudiante < ActiveRecord::Base
  belongs_to :carpeta
  belongs_to :periodo
  has_many :materia
  attr_accessible :periodo
end
