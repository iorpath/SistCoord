class RespuestaEncuestum < ActiveRecord::Base
  belongs_to :maestrium
  attr_accessible :encuestum
end
