class CoursesController < ApplicationController
  before_action :authenticate!, except: [:index, :show]
  before_action :set_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by(id:params[:id])
    @review = Review.new
    @reviews = @course.reviews.order(id: :desc)
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
    @course = current_user.courses.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :price, :intro, :hour)
  end
end
