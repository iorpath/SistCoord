class Estudiantematerium < ActiveRecord::Base
  belongs_to :estudiante
  belongs_to :materium
  belongs_to :tipo_pensum
  attr_accessible :estado
end
