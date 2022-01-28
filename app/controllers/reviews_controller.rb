class ReviewsController < ApplicationController
  before_action :authenticate!
  # 哪一門課
  def create
    course = Course.find(params[:course_id])

    @review = course.reviews.build(review_params)

    if @review.save
      # redirect_to course_path(course), notice: '完成評價'
    else
      # redirect_to course_path
    end
  end

  private
  def review_params
    params.require(:review)
    .permit(:rating, :title, :content) 
    .merge(user: current_user)
  end
end
