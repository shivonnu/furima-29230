class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:new, :create]

  def new
     @purchase = Purchase.new
     if    current_user.id == @item.user_id
           redirect_to root_path
     elsif Purchase.where(item_id: @item.id).present?
           redirect_to root_path
     end
 end

  def create
    
     @user = User.find_by(id: current_user.id)
     @purchase = Purchase.new(user_id: current_user.id, item_id: @item.id)
     redirect_to new_card_path and return unless current_user.card.present?
      if @purchase.save
          pay_item
      else
          flash.now
          render 'new'
      end
  end

  private
  def set_item
    @item = Item.find_by(id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @item.price, 
      customer: customer_token,
      currency:'jpy'
    )
  end
end
