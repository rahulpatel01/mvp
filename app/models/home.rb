class Home < ApplicationRecord
  def self.search(search)
    where("Title LIKE ? ","%#{search}%")
  end
end
