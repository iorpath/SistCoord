class CreateSeccions < ActiveRecord::Migration
  def change
    create_table :seccions do |t|
      t.references :materia
      t.string :etiqueta
      t.string :profesor
      t.string :salon

      t.timestamps
    end
    add_index :seccions, :materia_id
  end
end
