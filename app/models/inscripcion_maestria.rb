class InscripcionMaestria < ActiveRecord::Base
  belongs_to :estudiante
  belongs_to :maestrium
  attr_accessible :estado
end
