class Pensum < ActiveRecord::Base
  belongs_to :maestria
  has_many :tipo_pensum
  has_many :materia_pensums
  has_many :materia, :through => :materia_pensums
  attr_accessible :estado, :fechacreacion, :nombre, :maestria, :tipo_pensum
end
