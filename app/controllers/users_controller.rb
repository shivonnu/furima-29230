class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: current_user.id)
    @address = ShippingAddress.find_by(user_id: current_user.id)

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    card = Card.find_by(user_id: current_user.id) 

    redirect_to new_card_path and return unless current_user.card.present?

    customer = Payjp::Customer.retrieve(card.customer_token) 
    @card = customer.cards.first
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday) 
  end

end
