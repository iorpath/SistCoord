class Horario < ActiveRecord::Base
  belongs_to :seccion
  attr_accessible :dia, :hora_fin, :hora_inicio
end
