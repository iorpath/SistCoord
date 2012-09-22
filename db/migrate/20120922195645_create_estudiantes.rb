class CreateEstudiantes < ActiveRecord::Migration
  def change
    create_table :estudiantes do |t|
      t.references :user
      t.string :foto
      t.string :direccion
      t.string :telefono
      t.string :tipo_estudiante
      t.string :documento
      t.string :tipo_documento

      t.timestamps
    end
    add_index :estudiantes, :user_id
  end
end
