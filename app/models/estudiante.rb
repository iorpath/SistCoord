class Estudiante < ActiveRecord::Base
  belongs_to :user
  has_many :estudiante_seccions
  has_many :seccions, :through => :estudiante_seccions, :select => "estudiante_seccions.estado, seccions.*"
  has_many :estudiante_pensums
  has_many :pensums, :through => :estudiante_pensums, :select => "estudiante_pensums.estado, estudiante_pensums.created_at, pensums.*"
  has_many :estudiantepensums
  has_many :estudiantemateria
  attr_accessible :direccion, :documento, :foto, :telefono, :tipo_documento, :tipo_estudiante, :user, :user_id
  mount_uploader :foto, FileUploader
  
  #Retorna si una materia ya fue aprobada por el estudiante
  def is_materia_aprobada?(materia)
    secciones_estudiante = self.seccions
    if not secciones_estudiante.empty?
      secciones_estudiantes.each do |seccion|
        if seccion.materia == materia
          if seccion.estado == "aprobado"
            return true
          end
        end
      end
    end
    return false
  end
  

end
