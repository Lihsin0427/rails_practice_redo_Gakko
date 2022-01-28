class AddReviewsCountToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :reviews_count, :integer
  end
end
