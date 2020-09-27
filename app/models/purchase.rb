class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :shipping_address
  
  validates  :postal_code,      presence: true
  validates  :shipping_area_id, presence: true
  validates  :city,             presence: true
  validates  :address,          presence: true
  validates  :phone_number,     presence: true
end
