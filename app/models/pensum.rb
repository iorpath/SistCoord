class Pensum < ActiveRecord::Base
  belongs_to :maestria
  attr_accessible :fecha_creacion, :nombre
end
