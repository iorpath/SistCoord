class CreateEstudiantepensums < ActiveRecord::Migration
  def change
    create_table :estudiantepensums do |t|
      t.string :estado
      t.string :carpeta
      t.references :estudiante
      t.references :maestrium
      t.references :pensum

      t.timestamps
    end
    add_index :estudiantepensums, :pensum_id
    add_index :estudiantepensums, :estudiante_id
    add_index :estudiantepensums, :maestrium_id
    
  end
end
