class EncuestaMateria < ActiveRecord::Migration
  def change
    create_table :encuesta_materia do |t|
      t.references :encuestum
      t.references :materium
      t.timestamps
  end
  add_index :encuesta_materia, :encuestum_id
  add_index :encuesta_materia, :materium_id
  end
end