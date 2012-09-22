class CreateMateriaTipoPensums < ActiveRecord::Migration
  def change
    create_table :materia_tipo_pensums do |t|
      t.references :materia
      t.references :tipopensum

      t.timestamps
    end
    add_index :materia_tipo_pensums, :materia_id
    add_index :materia_tipo_pensums, :tipopensum_id
  end
end
