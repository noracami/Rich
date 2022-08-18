class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order, only: [:pay, :submit_payment]
  
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
    
    
    # pass client_token to your front-end
    @token = gateway.client_token.generate
  end

  # TODO post payment
  def submit_payment
    result = gateway.transaction.sale(
      amount: @order.price,
      payment_method_nonce: params[:nonce],
      # device_data: device_data_from_the_client,
      # options: {
      #   submit_for_settlement: true
      # }
    )

    if result.success?
      @order.pay!
      redirect_to root_path, notice: "交易成功"
    else
      @order.fail!
      redirect_to root_path, notice: "交易失敗"
    end
  end

  private

  def find_order
    @order = Order.find_by!(serial: params[:id])
  end

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
