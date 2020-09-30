class ShippingAddress < ApplicationRecord
  belongs_to :purchase, optional: true
end
