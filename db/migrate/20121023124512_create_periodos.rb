class CreatePeriodos < ActiveRecord::Migration
  def change
    create_table :periodos do |t|
      t.string, :nombre
      t.date, :fecha_inicio
      t.date, :fecha_fin
      t.boolean :vigente

      t.timestamps
    end
  end
end
