class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :show, :update, :destroy, :index]
  
  def index
    @items = Item.includes(:user).all.order("created_at DESC")   
  end

  def new
    @item = Item.new
  end

  def show
    @itemmessage = ItemMessage.all
    @message = MessageItemMessageAddress.new
    @messages = ItemMessage.includes(:message).where(item_id: @item.id)
  end
 
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      flash.now
      render :new
    
    end
  end

  def edit
    unless current_user.id == @item.user_id
       redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      flash.now
      render :edit
    end
  end
  
  def destroy
    if @item.delete
      redirect_to root_path
    else
      flash.now
      render :show
    end
  end
  private
  
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_fee_burden_id, :shipping_area_id, :days_to_ship_id, :price, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find_by(id: params[:id])
  end
end