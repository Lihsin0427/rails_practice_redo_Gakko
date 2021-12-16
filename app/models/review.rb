class Review < ApplicationRecord
  belongs_to :user
  belongs_to :course, counter_cache: true
  
  validates :rating, :title, :content, presence: true

end
