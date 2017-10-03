class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :is_male, :boolean, default: true
    add_column :users, :level_of_education, :string
    add_column :users, :concentration, :string
    add_column :users, :institution_of_education, :string
    add_column :users, :location, :string
    add_column :users, :race, :string
    add_column :users, :employment_status, :string
    add_column :users, :languages, :string
    add_column :users, :username, :string
    add_column :users, :bio, :string
  end
end
