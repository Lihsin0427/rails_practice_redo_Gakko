class OrdersController < ApplicationController

  def create
    @course = Course.find(params[:course_id])
    @order = @course.orders.build(order_params)
    
    if @order.save
      redirect_to root_path, notice: '課程購買成功'
    # render html: params
    end
  end

  private
  def order_params
    params.require(:order).permit( :recipient, :address).merge(user: current_user)
  end

end
