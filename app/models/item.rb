class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :status
  has_one    :purchase
  has_one_attached :image
  belongs_to :user
  validate :image_presence

  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'Please attach a jpeg or png file')
      end
    else
      errors.add(:image, 'Please attach the file')
    end
  end
 
  with_options presence: true do
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
    validates :name, :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
    validates :category_id, inclusion: { in: 1..10 }
    validates :status_id, inclusion: { in: 1..6 }
    validates :shipping_fee_burden_id, inclusion: { in: 1..2 }
    validates :shipping_area_id, inclusion: { in: 1..47 }
    validates :days_to_ship_id, inclusion: { in: 1..3 }
  end
  
 

end


