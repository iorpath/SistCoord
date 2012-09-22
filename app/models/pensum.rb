class Pensum < ActiveRecord::Base
  belongs_to :maestria
  has_many :tipo_pensum
  attr_accessible :estado, :fechacreacion, :nombre, :maestria, :tipo_pensum
end
