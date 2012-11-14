class AddColumn < ActiveRecord::Migration
  def change
    add_column :estudiantemateria, :area, :string
    add_column :materia_pensums, :area, :string
    change_column :materia_pensums, :semestre_sugerido, :string
  end
end
