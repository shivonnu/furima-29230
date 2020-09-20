class AddCommitsToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :commit, :string
  end
end
