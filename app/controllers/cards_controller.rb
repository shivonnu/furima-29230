class CardsController < ApplicationController
 

  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    customer = Payjp::Customer.create(
    description: 'test', 
    card: params[:token] 
    )
    card = Card.new( 
      card_token: params[:token], 
      customer_token: customer.id, 
      user_id: current_user.id 
    )
    binding.pry
    if card.save(purchase_params)
      redirect_to root_path
    else
      flash.now
      render :new
    end
  end
  private
  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end


end
