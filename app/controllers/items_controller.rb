class ItemsController < ApplicationController
  
  def index
    @items = Item.all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id]) 
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

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :category, :status, :shipping_fee_burden, :shipping_area, :days_to_ship, :price).merge(user_id: current_user.id)
  end
end


