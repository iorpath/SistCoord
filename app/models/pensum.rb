class Pensum < ActiveRecord::Base
  belongs_to :maestrium
  has_many :tipo_pensum
  has_many :materia_pensums
  has_many :materia, :through => :materia_pensums, :select => "materia.*, materia_pensums.semestre_sugerido as semestre"
  has_many :estudiante_pensums
  has_many :estudiantes, :through => :estudiante_pensums
  attr_accessible :estado, :fechacreacion, :nombre
  
  
  def materias_semestre_sugerido(semestre)
    mp = self.materia_pensums.where :semestre_sugerido =>  semestre
    materias = []
    mp.each do |fila|
      materia = Materium.find fila[:materium_id]
      materias << materia
    end
    return materias
  end
  
  
end
