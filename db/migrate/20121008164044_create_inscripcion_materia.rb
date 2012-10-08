class CreateInscripcionMateria < ActiveRecord::Migration
  def change
    create_table :inscripcion_materia do |t|
      t.references :estudiante
      t.references :materium
      t.references :seccion
      t.string :estado
      t.string :periodo

      t.timestamps
    end
    add_index :inscripcion_materia, :estudiante_id
    add_index :inscripcion_materia, :materium_id
    add_index :inscripcion_materia, :seccion_id
  end
end
