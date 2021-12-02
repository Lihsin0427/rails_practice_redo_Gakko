class Course < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }
  
  belongs_to :user
  has_many :reviews
  
  has_many :favor_courses
  has_many :favor_users, through: :favor_courses, source: :users
  # join table
end
