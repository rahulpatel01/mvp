class Donate < ApplicationRecord
  belongs_to :user
  enum amount_type: [:complete, :monthly]
  enum CreditCardType: [:Visa, :Maestro ]
end
