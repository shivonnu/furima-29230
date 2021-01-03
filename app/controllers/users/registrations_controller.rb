# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :set_user, only: [:edit, :edit_address, :update, :update_address]
  before_action :set_address, only: [:edit_address, :update_address]

  def new
    @user = User.new
  end

  def edit
  end

  def edit_address
  end

  def update
    if @user.update(user_params)
    else
      flash.now
      render :edit
    end
  end

  def update_address
    if @address.update(shipping_address_params)
    else
      flash.now
      render :edit_address
    end
  end

  def create
    @user = User.new(sign_up_params)
     unless @user.valid?
       render :new and return
     end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_shipping_address
    render :new_address
  end
 
  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = ShippingAddress.new(shipping_address_params)
     unless @address.valid?
       render :new_address and return
     end
    @user.build_shipping_address(@address.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end
 
  private

  def set_user
    @user = User.find_by(id: current_user.id)
  end

  def set_address
    @address = ShippingAddress.find_by(user_id: current_user.id) 
  end
 
  def shipping_address_params
    params.require(:shipping_address).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number)
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday) 
  end


  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
