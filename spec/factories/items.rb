FactoryBot.define do
  factory :item do
    association :user
    name                  {Faker::Restaurant.name}
    description           {Faker::Restaurant.description}
    category_id              {"1"}
    status_id                {"1"}
    price                 {"1000"}
    shipping_area_id         {"1"}
    shipping_fee_burden_id   {"1"}
    days_to_ship_id          {"1"}
   
    after(:build) do |item|
    item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
       

  end
end
