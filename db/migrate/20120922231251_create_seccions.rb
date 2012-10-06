class CreateSeccions < ActiveRecord::Migration
  def change
    create_table :seccions do |t|
      t.references :materium
      t.string :etiqueta
      t.string :profesor
      t.string :salon

      t.timestamps
    end
    add_index :seccions, :materium_id
  end
end
