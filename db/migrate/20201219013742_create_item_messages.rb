class CreateItemMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :item_messages do |t|
      t.integer :item_id,  null: false, foreign_key: :true
      t.integer :message_id, null: false, foreign_key: :true
      t.timestamps
    end
  end
end
