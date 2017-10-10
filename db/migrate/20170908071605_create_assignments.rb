class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.date :due_date

      t.timestamps
    end
    add_column :assignments, :start_time, :datetime
    add_column :assignments, :avatar, :string
    add_reference :assignments, :user, index: true
  end
end
