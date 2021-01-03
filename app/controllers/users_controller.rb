class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  before_action :set_address, only: [:show]

  def show
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    card = Card.find_by(user_id: current_user.id) 

    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token) 
    @card = customer.cards.first
  end

  private

  def set_user
    @user = User.find_by(id: current_user.id)
  end
  
  def set_address
    @address = ShippingAddress.find_by(user_id: current_user.id) 
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday) 
  end

  
end


