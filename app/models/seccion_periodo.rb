class SeccionPeriodo < ActiveRecord::Base
  belongs_to :periodo
  attr_accessible :seccion
end
