class CreateRespuestasEncuestum < ActiveRecord::Migration
  def change
    create_table :respuestas_encuestum do |t|
      t.references :encuestum
      t.references :maestrium

      t.timestamps
    end
    add_index :respuestas_encuestum, :maestrium_id
  end
end
