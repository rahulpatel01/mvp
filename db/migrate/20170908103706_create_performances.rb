class CreatePerformances < ActiveRecord::Migration[5.0]
  def change
    create_table :performances do |t|

      t.timestamps
    end
  end
end
