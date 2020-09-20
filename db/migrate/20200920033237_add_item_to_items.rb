class AddItemToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item, :string
  end
end
