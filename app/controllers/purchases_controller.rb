class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
 
  def index
     @purchase = PurchaseShippingAddress.new

 end
  def create
     @purchase = PurchaseShippingAddress.new(purchase_params)
    if 
      @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def set_item
    @item = Item.find_by(id: params[:item_id])
  end

  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
end

