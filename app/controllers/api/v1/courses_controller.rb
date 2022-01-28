class Api::V1::CoursesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :check_login

  def like
    course = Course.find(params[:id])

    favorited_course = FavorCourse.find_by(user: current_user, course: course)
    if favorited_course
      favorited_course.destroy
      render json: { result: 'unlike' }
    else
      current_user.favorite_courses << course
      # course.users << current_user
      # course.users = [current_user]
      render json: { result: 'like' }
    end
  end

  private
  
  def check_login
        #early return
    if not user_signed_in?
      render json: { status: 'fail', message: 'you need to login first' }, status: 401
      return
      
    end
  end
end
