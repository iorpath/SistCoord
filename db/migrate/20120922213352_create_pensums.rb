class CreatePensums < ActiveRecord::Migration
  def change
    create_table :pensums do |t|
      t.date :fechacreacion
      t.string :nombre
      t.boolean :estado
      t.references :maestrium

      t.timestamps
    end
    add_index :pensums, :maestrium_id
  end
end
