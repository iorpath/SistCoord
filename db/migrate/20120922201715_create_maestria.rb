class CreateMaestria < ActiveRecord::Migration
  def change
    create_table :maestria do |t|
      t.references :user
      t.string :nombre
      t.string :codigo

      t.timestamps
    end
    add_index :maestria, :user_id
  end
end
