class Student < ApplicationRecord
  validates :sid, presence: true, format: { with: /\A\d{2}(111[1-5])\d{4}\z/ }
  validates :name, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
