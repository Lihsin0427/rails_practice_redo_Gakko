class CoursesController < ApplicationController
  before_action :set_course, only: [:edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by(id:params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build(course_params)

    if @course.save
      redirect_to courses_path, notice: "課程新增成功!"
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @course.update(course_params)
      redirect_to courses_path, notice: "課程更新成功!"
    else
      render :edit
    end
  end

  def destroy
    @course.destroy

    redirect_to courses_path, notice: "課程已刪除!"
  end


  private
  def set_course
    begin
      @course = current_user.courses.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render file: 'public/404.html', layout: false, status: 404
    end
  end

  def require_login 
    redirect_to sign_in_path, notice: '請先登入會員' unless user_signed_in?
  end

  def course_params
    params.require(:course).permit(:name, :price, :intro, :hour)
  end
end
