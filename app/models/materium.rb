class Materium < ActiveRecord::Base
  belongs_to :maestrium
  has_and_belongs_to_many :tipo_pensums
  has_many :inscripcions, :as => :inscribible
  has_many :estudiantes, :through => :inscripcions
  attr_accessible :codigo, :nombre, :maestrium, :maestrium_id
end
