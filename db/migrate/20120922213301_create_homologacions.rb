class CreateHomologacions < ActiveRecord::Migration
  def change
    create_table :homologacions do |t|
      t.string :materiaorigen
      t.references :materia
      t.boolean :estado
      t.references :estudiante
      t.string :observaciones

      t.timestamps
    end
    add_index :homologacions, :materia_id
    add_index :homologacions, :estudiante_id
  end
end
