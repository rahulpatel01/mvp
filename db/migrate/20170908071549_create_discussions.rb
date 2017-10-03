class CreateDiscussions < ActiveRecord::Migration[5.0]
  def change
    create_table :discussions do |t|
      t.text :discussion

      t.timestamps
    end
    add_column :discussions, :user, :integer
    add_index :discussions, :user
    add_column :discussions, :subject, :integer
    add_index :discussions, :subject
  end
end
