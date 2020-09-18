class ItemsController < ApplicationController
 
 
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
  end
  
  private

  def item_params
    params.permit(:content, :image, :name, :description, :category, :status, :price, :shipping_area, :shipping_fee_burden, :days_to_ship).merge(user_id: current_user.id)
  end
end


