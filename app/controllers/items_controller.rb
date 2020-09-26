class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :show, :update]
  def index
    @items = Item.includes(:user).all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def show
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

  private
  
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_fee_burden_id, :shipping_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find_by(id: params[:id])
  end
end