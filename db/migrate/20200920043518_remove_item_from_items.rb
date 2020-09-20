class RemoveItemFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :commit, :string
  end
end
