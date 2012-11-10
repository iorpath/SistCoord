class CreateEstudiantemateria < ActiveRecord::Migration
  def change
    create_table :estudiantemateria do |t|
      t.string :estado
      t.references :periodo
      t.references :estudiante
      t.references :materium
      t.references :tipo_pensum

      t.timestamps
    end
    add_index :estudiantemateria, :estudiante_id
    add_index :estudiantemateria, :materium_id
    add_index :estudiantemateria, :tipo_pensum_id
    add_index :estudiantemateria, :periodo_id
  end
end
