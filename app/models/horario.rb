class Horario < ActiveRecord::Base
  belongs_to :seccion
  attr_accessible :dia, :hora_fin, :hora_inicio, :seccion, :seccion_id
  
  validates_presence_of :dia, :message => "Debe definir un dia"
  validates_presence_of :hora_inicio, :message => "Debe definir una hora de inicio"
  validates_presence_of :hora_fin, :message => "Debe definir una hora fin"
end
