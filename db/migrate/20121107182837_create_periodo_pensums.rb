class CreatePeriodoPensums < ActiveRecord::Migration
  def up
    create_table :periodo_pensums do |t|
      t.references :pensums
      t.references :periodo

      t.timestamps
    end
    add_index :periodo_pensums, :pensums_id
    add_index :periodo_pensums, :periodo_id
  end
  def down
    drop_table :periodo_pensums
  end
end
