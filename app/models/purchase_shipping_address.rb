class PurchaseShippingAddress
  
  include ActiveModel::Model

  attr_accessor  :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :purchase_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "が空です  ハイフン(-)を含めてください"}
    validates :phone_number, format: {with: /\A[0-9]{9,11}\z/, message: "が空です  11文字以内で入力してください ハイフン(-)を入れないで下さい"}
    validates :shipping_area_id, numericality: {other_than: 0}
    validates :city, :address, :phone_number
  end
 
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end


