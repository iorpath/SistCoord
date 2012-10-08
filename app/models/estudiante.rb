class Estudiante < ActiveRecord::Base
  belongs_to :user
  has_many :inscripcion_materia
  has_many :materia, :through => :inscripcion_materia
  has_many :inscripcion_maestria
  has_many :maestria, :through => :inscripcion_maestria
  attr_accessible :direccion, :documento, :foto, :telefono, :tipo_documento, :tipo_estudiante, :user, :user_id 
  mount_uploader :foto, FileUploader
  
  #Retorna si una materia ya fue aprobada por el estudiante
  def is_materia_aprobada?(materia)
    inscripcion_materia = InscripcionMateria.where :estudiante_id => self, :materium_id => materia
    if not inscripcion_materia.empty?
      if inscripcion_materia.first.estado == "aprobado"
        return true
      end
    end
    return false
  end
  
 end
