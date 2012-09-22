class Materium < ActiveRecord::Base
  belongs_to :maestria
  has_and_belongs_to_many :tipo_pensums
  has_many :inscripcions, :as => :inscribible
  has_many :estudiantes, :through => :inscripcions
  attr_accessible :codigo, :nombre, :maestria
end
