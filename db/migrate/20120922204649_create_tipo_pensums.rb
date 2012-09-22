class CreateTipoPensums < ActiveRecord::Migration
  def change
    create_table :tipo_pensums do |t|
      t.references :pensum
      t.string :descripcion
      t.int :cantidad

      t.timestamps
    end
    add_index :tipo_pensums, :pensum_id
  end
end
