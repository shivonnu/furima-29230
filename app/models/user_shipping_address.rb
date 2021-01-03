class UserShippingAddress
  
  include ActiveModel::Model

  attr_accessor :nickname, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, :user_id, :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number

  def update
    user = User.update(nickname: nickname, email: email, password: password, first_name: first_name, last_name: last_name, first_name_kana: first_name_kana, last_name_kana: last_name_kana, birthday: birthday)
    ShippingAddress.update(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, user_id: user.id)
  end
end
