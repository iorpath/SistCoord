class CreateEncuesta < ActiveRecord::Migration
  def change
    create_table :encuesta do |t|
      t.string :nombre
      t.references :maestrium
      t.boolean :habilitada

      t.timestamps
    end
    add_index :encuesta, :maestrium_id
  end
end
