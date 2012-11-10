class PeriodoPensum < ActiveRecord::Base
  belongs_to :pensum
  belongs_to :periodo
  has_many :materia
  attr_accessible :periodo
end
