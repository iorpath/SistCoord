class Estudiante < ActiveRecord::Base
  belongs_to :user
  has_many :estudiantepensums
  has_many :estudiantemateria
  attr_accessible :direccion, :documento, :foto, :telefono, :tipo_documento, :tipo_estudiante, :user, :user_id 
  mount_uploader :foto, FileUploader
 end
