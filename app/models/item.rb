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
  has_one    :message
  has_many :item_messages
  validate :image_presence

  def image_presence
    if images.attached?
    else
      errors.add(:images, 'を選択してください')
    end
  end
 
  with_options presence: true do
    validates :price, format: {with: /\A[0-9]+\z/, message: "が空です 半角で入力してください"}
    validates :name, :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "が設定可能範囲を超えています"}
    validates :category_id, inclusion: { in: 1..10 }
    validates :status_id, inclusion: { in: 1..6 }
    validates :shipping_fee_burden_id, inclusion: { in: 1..2 }
    validates :shipping_area_id, inclusion: { in: 1..47 }
    validates :days_to_ship_id, inclusion: { in: 1..3 }
  end
  
 

end


