class Performance < ApplicationRecord
  belongs_to :user
  has_one :course_progress
  has_many :grades
  has_one :feedback
end
