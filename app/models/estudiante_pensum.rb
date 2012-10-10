class EstudiantePensum < ActiveRecord::Base
  belongs_to :estudiante
  belongs_to :pensum
  attr_accessible :carpeta, :estado, :pensum, :estudiante, :maestrium
end
