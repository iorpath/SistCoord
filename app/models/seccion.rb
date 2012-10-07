class Seccion < ActiveRecord::Base
  belongs_to :materium
  attr_accessible :etiqueta, :profesor, :salon, :materium, :materium_id
  
  validates_presence_of :etiqueta, :message => "Debe definir una descripcion"
  validates_presence_of :profesor ,:message => "Debe indicar un profesor"
  validates_presence_of :salon, :message => "Debe establecer un salon"
end
