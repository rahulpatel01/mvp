class Subject < ApplicationRecord
  belongs_to :user
  has_one :calendar
  has_one :grade
  has_one :course_progress
  has_many :discussions
  mount_uploader :avatar, AvatarUploader
  has_many :ratings

  def self.search(term)
    where("Name LIKE ? ","%#{term}%")
  end

  def average_rating
    ratings.sum(:score) / ratings.size
  end
end
