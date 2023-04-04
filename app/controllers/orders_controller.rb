class OrdersController < ApplicationController

  def index
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :shipping_area_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: Order.item_id)
  end
end
