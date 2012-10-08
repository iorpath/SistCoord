class MateriaPensum < ActiveRecord::Base
  belongs_to :pensum
  belongs_to :materium
  attr_accessible :cantidad, :descripcion, :semestre_sugerido, :materium
end
