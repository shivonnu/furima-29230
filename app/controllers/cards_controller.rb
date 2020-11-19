class CardsController < ApplicationController
 

  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    customer = Payjp::Customer.create(
    description: 'test', 
    card: params[:token] 
    )
    @purchase = Card.new(card_params)
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
  def card_params
    params.require(:purchase_shipping_address).permit().merge(user_id: current_user.id, customer_token: customer.id, token: params[:token])
  end


end
