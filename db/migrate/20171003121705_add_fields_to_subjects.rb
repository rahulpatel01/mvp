class AddFieldsToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :homepage, :string
  end
end
