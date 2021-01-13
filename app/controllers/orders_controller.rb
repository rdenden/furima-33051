class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: :index

  def index
    @order_item = OrderItem.new
    
    redirect_to root_path if @item.user_id == current_user.id || @item.order
  end

  def create
    @order_item = OrderItem.new(order_params)
    @item = Item.find(@order_item.item_id)

    if @order_item.valid?
      pay_item

      @order_item.save
      redirect_to root_path
    else
      set_item
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_item).permit(:postalcode_id, :prefecture_id, :municipality, :add, :building, :tel).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
    
end
