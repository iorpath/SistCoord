class CreateRespuestasEncuestasMaterium < ActiveRecord::Migration
  def change
    create_table :respuestas_encuestas_materium do |t|
      t.references, :respuesta_encuestum
      t.references :materium

      t.timestamps
    end
    add_index :respuestas_encuestas_materium, :materium_id
  end
end
