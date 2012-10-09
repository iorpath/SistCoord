class EstudiantePensum < ActiveRecord::Base
  belongs_to :estudiante
  belongs_to :pensum
  attr_accessible :estado
end
