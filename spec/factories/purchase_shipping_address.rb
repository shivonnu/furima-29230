FactoryBot.define do
  factory :purchase_shipping_address do
    postal_code       { '123-4567' }
    shipping_area_id  { '鈴木' }
    city              { '東京都' }
    address           { '府中市東雲町２丁目' }
    building_name     { '東京ハイツ' }
    phone_number      { '09012345678' }
    token             { "tok_xxxxxxxx" }
  end
end

