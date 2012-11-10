class CreateSeccionesInscrita < ActiveRecord::Migration
  def change
    create_table :secciones_inscrita do |t|
      t.references :estudiante
      t.references :seccion
      t.references :periodo

      t.timestamps
    end
    add_index :secciones_inscrita, :periodo_id
  end
end
