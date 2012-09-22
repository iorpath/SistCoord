class CreateMateria < ActiveRecord::Migration
  def change
    create_table :materia do |t|
      t.string :codigo
      t.string :nombre
      t.references :maestria

      t.timestamps
    end
  end
end
