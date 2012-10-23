class Encuestum < ActiveRecord::Base
  belongs_to :maestrium
  has_and_belongs_to_many :materia
  attr_accessible :habilitada, :nombre, :maestrium, :maestrium_id
end
