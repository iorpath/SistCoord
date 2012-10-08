class CreateInscripcionMaestria < ActiveRecord::Migration
  def change
    create_table :inscripcion_maestria do |t|
      t.references :estudiante
      t.references :maestrium
      t.string :estado

      t.timestamps
    end
    add_index :inscripcion_maestria, :estudiante_id
    add_index :inscripcion_maestria, :maestrium_id
  end
end
