class AddItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :category_id,             :integer
    add_column :items, :days_to_ship_id,         :integer
    add_column :items, :shipping_area_id,        :integer
    add_column :items, :shipping_fee_burden_id, :integer
    add_column :items, :status_id,              :integer
  end
end
