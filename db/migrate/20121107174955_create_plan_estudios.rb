class CreatePlanEstudios < ActiveRecord::Migration
  def up
    create_table :plan_estudios do |t|
      t.references :pensum

      t.timestamps
    end
    add_index :plan_estudios, :pensum_id
  end
  
  def down
    drop_table :plan_estudios
  end
end
