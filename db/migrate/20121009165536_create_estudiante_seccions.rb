class CreateEstudianteSeccions < ActiveRecord::Migration
  def change
    create_table :estudiante_seccions do |t|
      t.references :estudiante
      t.references :seccion
      t.string :estado
      t.string :periodo

      t.timestamps
    end
    add_index :estudiante_seccions, :estudiante_id
    add_index :estudiante_seccions, :seccion_id
  end
end
