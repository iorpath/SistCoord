class CreateSeccionPeriodos < ActiveRecord::Migration
  def change
    create_table :seccion_periodos do |t|
      t.references, :seccion
      t.references :periodo

      t.timestamps
    end
    add_index :seccion_periodos, :periodo_id
  end
end
