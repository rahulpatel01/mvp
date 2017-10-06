class AddStartTimeToAssignments < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :start_time, :datetime
    add_column :assignments, :avatar, :string
    add_reference :assignments, :user, index: true
  end
end
