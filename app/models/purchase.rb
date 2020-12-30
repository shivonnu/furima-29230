class Purchase < ApplicationRecord
  belongs_to :user
 
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
  end

end
