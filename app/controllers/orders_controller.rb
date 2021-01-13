class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  
  def index
    @order_item = OrderItem.new
    @item = Item. find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
    
    
  end

  def create
    @order_item = OrderItem.new(order_params)
    @item = Item.find(@order_item.item_id)
    
     if @order_item.valid?
      pay_item
      
      
       @order_item.save
       redirect_to root_path
     else
       @item = Item. find(params[:item_id])
       render action: :index
     end
  end
    
   
  

  private
  def order_params
    params.require(:order_item).permit(:postalcode_id, :prefecture_id, :municipality, :add, :building, :tel ).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token],   
      currency: 'jpy'                
    )
  end
  

  

end
