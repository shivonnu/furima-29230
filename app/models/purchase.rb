class Purchase < ApplicationRecord
  attr_accessor  :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token
  belongs_to :user
  belongs_to :item
  has_one    :shipping_address
  
end
