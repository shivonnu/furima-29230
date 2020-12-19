class ItemMessage < ApplicationRecord
  belongs_to :message
  belongs_to :item
end
