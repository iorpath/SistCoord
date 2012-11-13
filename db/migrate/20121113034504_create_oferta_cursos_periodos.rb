class CreateOfertaCursosPeriodos < ActiveRecord::Migration
  def change
    create_table :oferta_cursos_periodos do |t|
      t.references :materium
      t.references :periodo
      t.timestamps
    end
    add_index :oferta_cursos_periodos, :materium_id
    add_index :oferta_cursos_periodos, :periodo_id
  end
end
