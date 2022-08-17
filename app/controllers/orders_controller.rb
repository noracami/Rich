class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @order = Order.new
  end

  def create
    order = current_user.orders.new(order_params)
    order.price = 10
    p order

    if order.save
      redirect_to '/', notice: '建立訂單成功'
      # 刷卡
    else
      redirect_to plans_path, notice: '系統忙碌中，請稍後再試'
    end
  end

  private

  def order_params
    params.require(:order).permit(:note)
  end
end
