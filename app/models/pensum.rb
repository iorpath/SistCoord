class Pensum < ActiveRecord::Base
  belongs_to :maestrium
  has_many :tipo_pensum
  has_many :periodo_pensums
  has_many :materia_pensums
  has_many :materia, :through => :materia_pensums, :select => "materia.*, materia_pensums.semestre_sugerido as semestre"
  has_many :estudiante_pensums
  has_many :estudiantes, :through => :estudiante_pensums
  attr_accessible :estado, :fechacreacion, :nombre, :maestrium, :maestrium_id, :materia, :tipo_pensum
  
  def dar_materias_semestre(semestre)
    mp = self.materia_pensums.where :semestre_sugerido =>  semestre
    materias = []
    mp.each do |fila|
      materia = Materium.find fila[:materium_id]
      materias << materia
    end
    return materias
  end

  def dar_semestres()
    semestres = []
    result = self.materia_pensums.find_by_sql("SELECT distinct semestre_sugerido from materia_pensums")
    result.each do |materia_pensum|
      if not materia_pensum.semestre_sugerido.nil?
      semestres.push(materia_pensum.semestre_sugerido)
      end
    end
    semestres = ["Primero", "Intersemestral 1", "Segundo", "Tercero", "Intersemestral 2", "Cuarto"]
    return semestres
  end

  def dar_areas_estudio()
    areas = []
    result = self.materia_pensums.find_by_sql("SELECT distinct area from materia_pensums")
    result.each do |materia_pensum|
      if not materia_pensum.area.nil?
      areas.push(materia_pensum.area)
      end
    end
    return areas
  end

  #Retorna un hash con las materias asociadas a un pensum por semestres
  #{:Fundamentacion=>[Materia1,Materia2],:Profundizacion=>[Materia1,Materia2]}
  def dar_materias_por_areas(semestre)
    areas = dar_areas_estudio()
    materias_area = {}

    areas.each do |area|
      materias = []
      mp = self.materia_pensums.where :semestre_sugerido =>semestre, :area=> area
      mp.each do |fila|
        materia = Materium.find fila[:materium_id]
        materias << materia
      end

      materias_area[area] = materias
    end
    return materias_area
  end
  
  #Retorna un hash con las materias de todos los semestres agrupadas por areas 
  #{:Primero=>{:Fundamentacion=>[Materia1,Materia2],:Profundizacion=>[Materia1,Materia2]}}
  def dar_materias()
    semestres = dar_semestres()
    materias_por_semestres = {}
    
    semestres.each do|semestre|
      materias_por_areas = dar_materias_por_areas(semestre)
      materias_por_semestres[semestre] =  materias_por_areas       
     
    end
    return materias_por_semestres
  end
end

