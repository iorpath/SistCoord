class CreatePensums < ActiveRecord::Migration
  def change
    create_table :pensums do |t|
      t.date :fechacreacion
      t.string :nombre
      t.boolean :estado
      t.references :maestria

      t.timestamps
    end
    add_index :pensums, :maestria_id
  end
end
