class CreateUserAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_assignments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :educator, index: true
      t.belongs_to :assignment, index: true
      t.string :description
      t.string :avatar

      t.timestamps
    end
  end
end
