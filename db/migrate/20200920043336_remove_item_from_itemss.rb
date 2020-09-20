class RemoveItemFromItemss < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :item, :string
  end
end
