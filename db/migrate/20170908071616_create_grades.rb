class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.string :grade

      t.timestamps
    end
    add_column :grades, :performance, :integer
    add_index  :grades, :performance
  end
end
