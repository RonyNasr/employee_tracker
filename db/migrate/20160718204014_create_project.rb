class CreateProject < ActiveRecord::Migration
  def change
    create_table(:projects) do |t|
      t.column(:name, :string)
      t.timestamps
      # t.column(:employee_id, :int)
    end
    add_column(:employees, :project_id, :int)
  end
end
