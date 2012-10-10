class CreateEstudiantePensums < ActiveRecord::Migration
  def change
    create_table :estudiante_pensums do |t|
      t.references :estudiante
      t.references :pensum
      t.string :estado
      t.string :carpeta
      t.timestamps
    end
    add_index :estudiante_pensums, :estudiante_id
    add_index :estudiante_pensums, :pensum_id
  end
end
