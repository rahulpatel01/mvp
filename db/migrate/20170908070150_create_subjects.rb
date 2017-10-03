class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :objective
      t.text :lesson_plan
      t.text :content      

      t.timestamps
    end
  end
end
