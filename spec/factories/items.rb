FactoryBot.define do
  factory :item do
    name                      { Faker::Name.initials(number: 5) }
    info                      { Faker::Lorem.sentence }
    category_id               { 2 }
    sales_status_id	          { 4 }
    shipping_fee_status_id { 3 }
    prefecture_id             { 7 }
    scheduled_delivery_id     { 2 }
    price                     { '3000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
