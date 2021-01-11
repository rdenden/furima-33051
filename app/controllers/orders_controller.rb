class OrdersController < ApplicationController
  def index
    @order_item = OrderItem.new
    @item = Item. find(params[:item_id])
    
  end

  def create
  end

end
