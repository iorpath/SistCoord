class MateriaTipoPensum < ActiveRecord::Base
  belongs_to :materia
  belongs_to :tipopensum
  
  attr_accessible :materia, :tipopensum
end
