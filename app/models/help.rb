class Help < ApplicationRecord
  enum user_type: [:student, :educator]
  enum level_type: [:beginner, :intermediate, :advanced]
end
