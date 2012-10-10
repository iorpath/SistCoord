class User < ActiveRecord::Base
  has_one :estudiante
  accepts_nested_attributes_for :estudiante 
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :estudiante_attributes

def estudiante_attributes(params)
  estudiante = Estudiante.new params[:estudiantes]
end

end
