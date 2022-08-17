class OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end

  def create
    redirect_to new_order_path, notice: "iii"
  end

  def show
  end
end
