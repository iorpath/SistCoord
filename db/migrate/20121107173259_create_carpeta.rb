class CreateCarpeta < ActiveRecord::Migration
  def up
    create_table :carpeta do |t|
      t.references :estudiante

      t.timestamps
    end
    add_index :carpeta, :estudiante_id
  end
  def down
    drop_table :carpeta
  end
end
