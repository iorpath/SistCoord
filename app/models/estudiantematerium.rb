class Estudiantematerium < ActiveRecord::Base
  belongs_to :estudiante
  belongs_to :materium
  belongs_to :tipo_pensum
  belongs_to :periodo
  attr_accessible :estado, :periodo, :materium, :id, :estudiante
  validates_uniqueness_of :estudiante_id, :scope => [:materium_id]
  
  def self.encontrar_id(estado, periodo,materia,estudiante)
    em = self.where :estado=>estado, :periodo_id=>periodo, :materium_id=>materia, :estudiante_id=>estudiante
    return em.first.id
  end

  def self.encontrar(materia, estudiante)
    em = self.where :materium_id=>materia, :estudiante_id=>estudiante
    if not em.first.nil?
      return em.first
    else
      return nil
    end
  end
end
