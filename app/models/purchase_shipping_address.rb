class PurchaseShippingAddress
  
  include ActiveModel::Model

  attr_accessor  :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token, :purchase_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)."}
    validates :phone_number, format: {with: /\A[0-9]{9,11}\z/, message: "is invalid. Within 11 digits. Do not put hyphens."}
    validates :shipping_area_id, numericality: {other_than: 0}
    validates :city, :address, :phone_number, :token
  end
 
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end