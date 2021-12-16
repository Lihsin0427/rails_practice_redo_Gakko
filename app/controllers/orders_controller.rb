class OrdersController < ApplicationController

  def create
    @course = Course.find(params[:course_id])
    @order = @course.prepare_order(order_params)
    # @order = @course.orders.build(order_params)
    # @order.state = 'pending'
    # @order.amount = @course.price
    if @order.save

      gateway = Braintree::Gateway.new(
        environment: :sandbox,
        merchant_id: ENV['braintree_merchant_id'],
        public_key: ENV['braintree_public_key'],
        private_key: ENV['braintree_private_key']
      )

      result = gateway.transaction.sale(
        amount: @order.amount,
        payment_method_nonce: params[:nonce]
      )

      if result.success?
        # @order.update(state: 'paid', paid_at: Time.current)
        @order.pay! if @order.may_pay?
        # 刷卡
        redirect_to root_path, notice: '課程購買成功'
      else
        redirect_to root_path, notice: '付款過程發生問題'
      end
    end
  end

  private
  def order_params
    params.require(:order).permit( :recipient, :address).merge(user: current_user)
  end

end
