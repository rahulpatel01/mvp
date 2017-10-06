class UserAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :educator, :class_name => "User"
  belongs_to :assignment
end
