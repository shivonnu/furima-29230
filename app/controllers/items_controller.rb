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
    @tag = ItemTag.includes(:tag).where(item_id: @item.id)
    @message = MessageItemMessageAddress.new
    @messages = ItemMessage.includes(:message).where(item_id: @item.id)
  end

  def new_tags
    @item = Item.find_by(id: params[:id])
    @item_tag_include = ItemTagInclude.new

  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to item_tags_path(@item.id)
    else
      flash.now
      render :new
    end
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  
  def create_tags
    @item_tag_include = ItemTagInclude.new(tag_params)
    if  @item_tag_include.save
        redirect_to root_path
    else
        flash.now
        render :new_tag
    end
  end

  def edit_tags
    @tag = ItemTag.includes(:tag).where(item_id: params[:id])
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

  def tag_params
    params.require(:item_tag_include).permit(:tag_name).merge(item_id: params[:item_id])
  end

  def set_item
    @item = Item.find_by(id: params[:id])
  end

end