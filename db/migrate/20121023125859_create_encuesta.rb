class CreateEncuesta < ActiveRecord::Migration
  def change
    create_table :encuesta do |t|
      t.string :nombre
      t.references :maestrium
      t.boolean :habilitada

      t.timestamps
    end
  end
end
