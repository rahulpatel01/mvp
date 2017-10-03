class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.date :due_date

      t.timestamps
    end
    add_column :assignments, :user, :integer
    add_index :assignments, :user
  end
end
