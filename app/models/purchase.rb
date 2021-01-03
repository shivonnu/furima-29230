class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  # with_options presence: true do
  #   validates :city, :address, :phone_number
  # end
end
