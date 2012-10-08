class Materium < ActiveRecord::Base
  belongs_to :maestrium
  has_and_belongs_to_many :tipo_pensums
  has_many :materia_pensums
  has_many :pensums, :through => :materia_pensums
  has_many :inscripcion_materia
  has_many :estudiantes, :through => :inscripcion_materia
  attr_accessible :codigo, :nombre, :maestrium, :maestrium_id
  
end
