class OfertaCursosPeriodo < ActiveRecord::Base
  belongs_to :materium
  belongs_to :periodo
  attr_accessor :materium, :periodo
  attr_accessible :materium, :periodo
end
