class PurchaseShippingAddress

  include ActiveModel::Model
  attr_accessor  :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token, :purchase_id

  validates  :postal_code,      presence: true
  validates  :shipping_area_id, presence: true
  validates  :city,             presence: true
  validates  :address,          presence: true
  validates  :phone_number,     presence: true

 def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
 
end
