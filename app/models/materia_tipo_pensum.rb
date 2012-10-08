class MateriaTipoPensum < ActiveRecord::Base
  belongs_to :materium
  belongs_to :tipopensum
  
  attr_accessible :materium, :tipopensum
end
