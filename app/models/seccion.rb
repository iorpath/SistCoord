class Seccion < ActiveRecord::Base
  belongs_to :materium
  attr_accessible :etiqueta, :profesor, :salon, :materium, :materium_id
end
