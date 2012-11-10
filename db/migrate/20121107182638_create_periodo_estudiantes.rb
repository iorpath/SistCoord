class CreatePeriodoEstudiantes < ActiveRecord::Migration
  def up
    create_table :periodo_estudiantes do |t|
      t.references :carpeta
      t.references :periodo

      t.timestamps
    end
    add_index :periodo_estudiantes, :carpeta_id
    add_index :periodo_estudiantes, :periodo_id
  end
  def down
    drop_table :periodo_estudiantes
  end
end
