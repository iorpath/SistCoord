class CreateMateriaTipoPensums < ActiveRecord::Migration
  def change
    create_table :materia_tipo_pensums do |t|
      t.references :materium
      t.references :tipo_pensum

      t.timestamps
    end
    add_index :materia_tipo_pensums, :materium_id
    add_index :materia_tipo_pensums, :tipo_pensum_id
  end
end
