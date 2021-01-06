class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :status
  has_one    :purchase
  has_many_attached :images
  belongs_to :user
  has_many :item_messages
  has_many :item_tags
  has_many :tags, through: :item_tags

end


