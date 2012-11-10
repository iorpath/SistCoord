class Carpeta < ActiveRecord::Base
  belongs_to :estudiante
  has_many :periodo_estudiante
  attr_accessible :periodo_estudiante
  # attr_accessible :title, :body
end
