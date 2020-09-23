class ItemsController < ApplicationController
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :days_to_ship, :shipping_area, :shipping_fee_burden, :status

  def index
    @items = Item.all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def show
    @show = Item.find(params[:id]) 
    @category = Category.all
    @days_to_ship = Days_to_ship.all
    @shipping_area = Shipping_area.all
    @shipping_fee_burden = Shipping_fee_burden.all
    @status = Status.all
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


