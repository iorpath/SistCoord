class CreateMateria < ActiveRecord::Migration
  def change
    create_table :materia do |t|
      t.string :codigo
      t.string :nombre
      t.references :maestrium

      t.timestamps
    end
  end
end
