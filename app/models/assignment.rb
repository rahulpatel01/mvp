class Assignment < ApplicationRecord
  # belongs_to :subject
  belongs_to :user
  has_many :user_assignments
  mount_uploader :avatar, AvatarUploader
end
