class AddAvatarToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :avatar, :string
  end
end
