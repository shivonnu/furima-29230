

class ItemTagInclude

  include ActiveModel::Model

  attr_accessor :name, :description, :category_id, :status_id, :shipping_fee_burden_id, :shipping_area_id, :days_to_ship_id, :price, :tag_name, :tag_id, :item_id, :user_id, :image_presence, :images


  # validate :image_presence

  # def image_presence
  #   @item = Item.new
  #   if @item.images.attached?
  #   else
  #     errors.add(:images, 'を選択してください')
  #   end
  # end
 
  with_options presence: true do
    validates :price, format: {with: /\A[0-9]+\z/, message: "が空です 半角で入力してください"}
    validates :name, :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "が設定可能範囲を超えています"}
    validates :category_id, inclusion: { in: 1..10 }
    validates :status_id, inclusion: { in: 1..6 }
    validates :shipping_fee_burden_id, inclusion: { in: 1..2 }
    validates :shipping_area_id, inclusion: { in: 1..47 }
    validates :days_to_ship_id, inclusion: { in: 1..3 }
    validates :images
  end

  def save
    item = Item.create(name: name, description: description, category_id: category_id, status_id: status_id, shipping_fee_burden_id: shipping_fee_burden_id, shipping_area_id: shipping_fee_burden_id, days_to_ship_id: days_to_ship_id, price: price, images: [])
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ItemTag.create(tag_id: tag.id, item_id: item.id)
  end
end