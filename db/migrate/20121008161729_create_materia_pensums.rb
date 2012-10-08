class CreateMateriaPensums < ActiveRecord::Migration
  def change
    create_table :materia_pensums do |t|
      t.references :pensum
      t.references :materium
      t.text :descripcion
      t.integer :cantidad
      t.integer :semestre_sugerido

      t.timestamps
    end
    add_index :materia_pensums, :pensum_id
    add_index :materia_pensums, :materium_id
  end
end
