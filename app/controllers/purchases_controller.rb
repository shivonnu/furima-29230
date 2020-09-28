class PurchasesController < ApplicationController
  attr_accessor  :token
  before_action :set_item, only: [:index, :create]
 def index
  
 end
  def create
    @purchase = PurchaseShippingAddress.new(purchase_params)

    if @purchase.valid?
      binding.pry
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

  def order_params
    params.permit(:token)
  end

  def purchase_params
    params.permit(:token, :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :item_id ).merge(user_id: current_user.id)

  end

  def pay_item
    Payjp.api_key = "sk_test_0e474b323702bfe62df227ed"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
