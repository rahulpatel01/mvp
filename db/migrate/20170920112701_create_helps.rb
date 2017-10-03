class CreateHelps < ActiveRecord::Migration[5.0]
  def change
    create_table :helps do |t|
      t.integer :user_type
      t.text :learn
      t.integer :level_type
      t.text :goal
      t.string :email,            null: false, default: ""
      t.text :description,              null: false, default: ""
      t.string :avatar

      t.timestamps
    end
  end
end
