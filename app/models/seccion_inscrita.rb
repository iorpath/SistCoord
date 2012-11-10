class SeccionInscrita < ActiveRecord::Base
  belongs_to :periodo
  attr_accessible :estudiante, :seccion
end
