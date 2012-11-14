class Estudiante < ActiveRecord::Base
  belongs_to :user
  has_one :carpeta
  has_many :estudiante_seccions
  has_many :seccions, :through => :estudiante_seccions, :select => "estudiante_seccions.estado, seccions.*"
  has_many :estudiante_pensums
  has_many :pensums, :through => :estudiante_pensums, :select => "estudiante_pensums.estado, estudiante_pensums.created_at, pensums.*"
  has_many :estudiantepensums
  has_many :estudiantemateria
  attr_accessible :direccion, :documento, :foto, :telefono, :tipo_documento, :tipo_estudiante, :user, :user_id, :pensums, :carpeta
  mount_uploader :foto, FileUploader
  after_create :crear_carpeta
  #Retorna si una materia ya fue aprobada por el estudiante
  def is_materia_aprobada?(materia)
    estudiante_materia = self.estudiantemateria
    if not estudiante_materia.empty?
      estudiante_materia.each do |em|
        if em.materia == materia
          if em.estado == "vista"
          return true
          end
        end
      end
    end
    return false
  end

  def estado_materia (materia)
    estado = ""
    estudiante_materia = self.estudiantemateria
    if not estudiante_materia.empty?
      estudiante_materia.each do |em|
        if em.materium == materia
           estado = em.estado
        end
      end
    else
      estado = "pendiente"
    end
    return estado
  end

  #Retorna los periodos en los que ha estado activo un estudiante(inscrito materias)
  def dar_periodos()
    periodos = []
    result_set = self.estudiantemateria.find_by_sql("SELECT distinct periodo_id FROM estudiantemateria GROUP BY periodo_id,id")
    result_set.each do |estudiante_materium|
      periodos.push(estudiante_materium.periodo)
    end
    return
  end

  def dar_materias_paneadas(periodo)
    materias = []
    estudiante_materia = self.estudiantemateria.where :estado=>"planeada", :periodo_id=>periodo
    estudiante_materia.each do |em|
    materias << em.materium
    end
    return materias
  end
  #Callback para asegurar que un estudiante siempre tiene una carpeta creada
  protected

  def crear_carpeta
    carpeta = Carpeta.create
    periodo = PeriodoEstudiante.create :periodo => Periodo.last
    carpeta.periodo_estudiante.push(periodo)
    carpeta.save
    self.carpeta = carpeta
  end

end
