class Materium < ActiveRecord::Base
  belongs_to :maestrium
  belongs_to :periodo_estudiante
  belongs_to :periodo_pensum
  has_and_belongs_to_many :tipo_pensums
  has_many :materia_pensums
  has_many :pensums, :through => :materia_pensums
  attr_accessor :estop
  attr_accessible :codigo, :nombre, :maestrium, :maestrium_id, :estop
end
