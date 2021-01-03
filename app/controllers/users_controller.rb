class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  before_action :set_shippingaddress, only: [:show]

  def show
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    card = Card.find_by(user_id: current_user.id) 

    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token) 
    @card = customer.cards.first
  end
  
  def edit
    @user = User.find_by(id: current_user.id)
    @address = ShippingAddress.find_by(user_id: current_user.id)
    
  end

  # def update
  #   @user = User.find_by(id: current_user.id)
  #   @user.update(user_params)
  #   unless @user.valid?
  #     render :edit and return
  #   end
  #   @address = @user.build_shipping_address
  #   redirect_to edit_address_path
    
  # end

  # def update_address
  #   @user = User.find_by(id: current_user.id)
  #   @address = ShippingAddress.all
  #   unless @address.valid?
  #      render :edit_address and return
  #    end
  #    @address.update(shipping_address_params)
  #    redirect_to root_path
  # end

  # def update
  #   if @user.update(user_params)
  #     redirect_to root_path
  #   else
  #     flash.now
  #     render :show
  #   end
  # end

  private

  def set_user
    @user = User.find_by(id: current_user.id)
  end
  def set_shippingaddress
    @shippingaddress = ShippingAddress.find_by(user_id: current_user.id) 

  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday) 
  end

  
end


