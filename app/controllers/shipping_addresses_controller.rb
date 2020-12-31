class ShippingAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:new, :create]
 
  def index
  end

  def new
 end


  def create
     @shipping_address = ShippingAddress.new(shipping_address_params)
      if @shipping_address.valid?
          @shipping_address.save
          redirect_to root_path
      else
          flash.now
          render :new
      end
  end

  private
  def set_item
    @item = Item.find_by(id: params[:item_id])
  end

  def shipping_address_params
    params.require(:shipping_address).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number)
  end
