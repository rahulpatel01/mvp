class CourseProgress < ApplicationRecord
  belongs_to :performance
  belongs_to :subject
end
