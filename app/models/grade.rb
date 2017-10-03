class Grade < ApplicationRecord
  belongs_to :subject
  belongs_to :performance  
end
