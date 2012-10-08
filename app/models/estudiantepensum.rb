class Estudiantepensum < ActiveRecord::Base
  belongs_to :pensum
  belongs_to :estudiante
  belongs_to :maestrium
  attr_accessible :carpeta, :estado, :pensum, :estudiante, :maestrium
end
