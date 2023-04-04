class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_params, only: [:show, :edit]

  def index
    @items = Item.order('created_at DESC').includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if user_signed_in?
      redirect_to root_path if current_user.id != @item.user_id
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :delivery_charge_id, :shipping_area_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end
end
