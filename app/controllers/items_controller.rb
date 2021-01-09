class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: :edit
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

  def index
    @items = Item.all.order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :comment, :category_id, :condition_id, :delivery_fee_id, :prefecture_id,
                                 :schedule_id).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    redirect_to action: :index unless item.user.id == current_user.id
  end
end
