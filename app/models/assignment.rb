class Assignment < ApplicationRecord
  after_create_commit { notify }
  # belongs_to :subject
  belongs_to :user
  has_many :user_assignments
  mount_uploader :avatar, AvatarUploader

  private

  def notify
    Notification.create(event: "New Assignment")
  end
end
