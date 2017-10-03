class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.integer :to
      t.integer :sender 
      t.text :feedback

      t.timestamps
    end
    add_column :feedbacks, :performance, :integer
    add_index :feedbacks, :performance
    add_column :feedbacks, :user, :integer
    add_index :feedbacks, :user
  end
end
