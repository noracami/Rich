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
      redirect_to pay_order_path(id: order.serial), notice: '建立訂單成功'
      # 刷卡
    else
      redirect_to plans_path, notice: '系統忙碌中，請稍後再試'
    end
  end

  def pay
    @order = Order.find_by!(serial: params[:id])
    
    # pass client_token to your front-end
    @token = gateway.client_token.generate
  end

  # TODO post payment
  def submit_payment
  
  end

  private

  def order_params
    params.require(:order).permit(:note)
  end

  def gateway
    Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: ENV['MERCHANT_ID'],
      public_key: ENV['PUBLIC_KEY'],
      private_key: ENV['PRIVATE_KEY'],
    )
  end
end
