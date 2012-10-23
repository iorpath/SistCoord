class RespuestaEncuestaMaterium < ActiveRecord::Base
  belongs_to :materium
  attr_accessible :respuesta_encuestum
end
