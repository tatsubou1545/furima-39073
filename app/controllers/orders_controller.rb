class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_prams, only: [:index, :create]
  before_action :return_top, only: [:index]
  before_action :order_present?, only: [:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_info
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :shipping_area_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_info
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def return_top
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end 

  def item_prams
    @item = Item.find(params[:item_id])
  end

  def order_present? 
    if @item.order.present?
      redirect_to root_path
    end
  end
end
