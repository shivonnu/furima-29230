class ShippingAddress < ApplicationRecord
  belongs_to :user, optional: true
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "が空です  ハイフン(-)を含めてください"}
    validates :phone_number, format: {with: /\A[0-9]{9,11}\z/, message: "が空です  11文字以内で入力してください ハイフン(-)を入れないで下さい"}
    validates :shipping_area_id, numericality: {other_than: 0}
    validates :city, :address, :phone_number
  end
end
