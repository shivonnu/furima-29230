class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :show, :update, :destroy, :index]
  
  def index
    @items = Item.includes(:user).all.order("created_at DESC")   
  end

  def new
    @item = Item.new
    @items = ItemTagInclude.new
  end

  def show
    @tag = Tag.includes(:tag).where(item_id: @item.id)
    @message = MessageItemMessageAddress.new
    @messages = ItemMessage.includes(:message).where(item_id: @item.id)
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end
 
  def create
    @item = ItemTagInclude.new(item_tag_include_params)
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
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_fee_burden_id, :shipping_area_id, :days_to_ship_id, :price, :tag_name, images: []).merge(user_id: current_user.id)
  end

  def item_tag_include_params
    params.require(:item_tag_include).permit(:name, :description, :category_id, :status_id, :shipping_fee_burden_id, :shipping_area_id, :days_to_ship_id, :price, :tag_name, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find_by(id: params[:id])
  end
end