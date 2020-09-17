class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                  null: false
      t.text    :description,           null: false
      t.integer :category,              null: false
      t.integer :status,                null: false
      t.integer :price,                 null: false
      t.integer :shipping_area,         null: false
      t.integer :shipping_fee_burden,   null: false
      t.integer :days_to_ship,          null: false
      t.integer :user_id,               null: false
      t.timestamps
    end
  end
end
