class Estudiante < ActiveRecord::Base
  belongs_to :user
  attr_accessible :direccion, :documento, :foto, :telefono, :tipo_documento, :tipo_estudiante
end
