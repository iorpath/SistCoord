class Maestrium < ActiveRecord::Base
  belongs_to :user
  has_many :pensums
  has_many :inscripcion_maestria
  has_many :estudiantes, :through => :inscripcion_maestria
  attr_accessible :codigo, :nombre, :user, :user_id
  
  #Retorna el pensum vigente para esta maestria
  #Por ahora retorna el ultimo pensum inscrito
  def pensum_actual
    return Pensum.last
  end
  
end
