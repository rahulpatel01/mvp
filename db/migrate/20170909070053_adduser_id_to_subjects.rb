class AdduserIdToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_reference :subjects, :user, index: true
  end
end
