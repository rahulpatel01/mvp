class CreateCourseProgresses < ActiveRecord::Migration[5.0]
  def change
    create_table :course_progresses do |t|
      t.integer :time_spent
      t.integer :time_due

      t.timestamps
    end
    add_column :course_progresses, :performance, :integer
    add_index :course_progresses, :performance
  end
end
