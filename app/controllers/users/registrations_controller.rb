# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: current_user.id)
  end

  def edit_address
    @user = User.find_by(id: current_user.id)
    @address = ShippingAddress.find_by(user_id: @user.id)
  end

  def update
    @user = User.find_by(id: current_user.id)
    if @user.update(user_params)
    
    else
      flash.now
      render :edit
    end
    # unless @user.valid?
    #   render :edit and return
    # end
    # @user.update
    # if @address.update(shipping_address_params)
    #   redirect_to item_path(@item.id)
    # else
    #   flash.now
    #   render :edit
    # end
    # @address = User.find_by(id: current_user.id)
    # @address = UserShippingAddress.update
    # redirect_to root_path
  end

  def update_address
    @user = User.find_by(id: current_user.id)
    @address = ShippingAddress.find_by(user_id: @user.id)
    unless @address.valid?
      render :edit_address and return
    end
    @address.update(shipping_address_params)
    # @address = ShippingAddress.new(shipping_address_params)
    #  unless @address.valid?
    #   render :edit_address and return
    # end
    # @address.update(shipping_address_params)
    # @user.build_shipping_address(@address.attributes)
    # @user.update
    # sign_in(:user, @user)
  end

  # def update
  #   @user = User.find_by(id: current_user.id)
  #   @user = User.new(user_params)
  #   unless @user.valid?
  #     render :edit and return
  #   end
  #   session["devise.regist_data"] = {user: @user.attributes}
  #   session["devise.regist_data"][:user]["password"] = params[:user][:password]
  #   @address = @user.build_shipping_address
  #   render :edit_address
    
  # end

  # def update_address
  #   @user = User.find_by(id: current_user.id)
  #   @user = User.new(session["devise.regist_data"]["user"])
  #   @address = ShippingAddress.new(shipping_address_params)
  #    unless @address.valid?
  #      render :new_address and return
  #    end
  #   @user.build_shipping_address(@address.attributes)
  #   @user.update
  #   session["devise.regist_data"]["user"].clear
  #   sign_in(:user, @user)
  # end

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
