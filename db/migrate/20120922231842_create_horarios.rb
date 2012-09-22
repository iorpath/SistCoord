class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.references :seccion
      t.string :dia
      t.time :hora_inicio
      t.time :hora_fin

      t.timestamps
    end
    add_index :horarios, :seccion_id
  end
end
