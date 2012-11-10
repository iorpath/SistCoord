class CreatePeriodos < ActiveRecord::Migration
  def change
    create_table :periodos do |t|
      t.integer :ano
      t.string :semestre

      t.timestamps
    end
  end
end
