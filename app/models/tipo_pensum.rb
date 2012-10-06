class TipoPensum < ActiveRecord::Base  
  belongs_to :pensum
  has_and_belongs_to_many :materia
  attr_accessible :cantidad, :descripcion, :pensum, :materia
end
