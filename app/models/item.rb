class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  validate :image_presence

  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image, 'ファイルを添付してください')
    end
  end
  validates :name, presence: true
  validates :category, inclusion: { in: 1..10 }
  validates :status, inclusion: { in: 1..6 }
  validates :shipping_fee_burden, inclusion: { in: 1..2 }
  validates :shipping_area, inclusion: { in: 1..47 }
  validates :days_to_ship, inclusion: { in: 1..3 }
  with_options presence: true do
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
 

end


