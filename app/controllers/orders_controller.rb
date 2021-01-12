class OrdersController < ApplicationController
  def index
    @order_item = OrderItem.new
    @item = Item. find(params[:item_id])
    
  end

  def create
    @order_item = OrderItem.new(order_params)
    
     if @order_item.valid?
       @order_item.save
       redirect_to root_path
     else
       @item = Item. find(params[:item_id])
       render action: :index
     end
  end
    
   
  

  private
  def order_params
    params.require(:order_item).permit(:postalcode_id, :prefecture_id, :municipality, :add, :building, :tel ).merge(item_id: params[:item_id], user_id: current_user.id )
  end

end
