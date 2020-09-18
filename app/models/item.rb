class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image
  
  with_options presence: true do
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end
