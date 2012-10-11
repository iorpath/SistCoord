class Maestrium < ActiveRecord::Base
  belongs_to :user
  has_many :pensums
  attr_accessible :codigo, :nombre, :user, :user_id
  #after_create :crear_pensum
  #Retorna el pensum vigente para esta maestria
  #Por ahora retorna el ultimo pensum inscrito
  def pensum_actual
    return Pensum.last
  end

  #Retorna las materias segun semestre sugerido

  private

  def crear_pensum
    puts "llamando after_create"
    primer_pensum = Pensum.create :nombre => "Por favor configure el pensum vigente"
    self.pensums << primer_pensum
  end
end
