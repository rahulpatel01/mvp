class Rating < ApplicationRecord
  belongs_to :subject
  belongs_to :user
end
