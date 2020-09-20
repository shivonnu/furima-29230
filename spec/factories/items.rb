FactoryBot.define do
  factory :item do
    association :user
    name                  {Faker::Restaurant.name}
    description           {Faker::Restaurant.description}
    category              {"1"}
    status                {"1"}
    price                 {"1000"}
    shipping_area         {"1"}
    shipping_fee_burden   {"1"}
    days_to_ship          {"1"}
   
    
          
    after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
       

  end
end
