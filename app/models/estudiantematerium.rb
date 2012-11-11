class Estudiantematerium < ActiveRecord::Base
  belongs_to :estudiante
  belongs_to :materium
  belongs_to :tipo_pensum
  belongs_to :periodo
  attr_accessible :estado, :periodo, :materium
end
