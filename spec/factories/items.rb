FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    category_id { 2 }
    status_id { 2 }
    explain { Faker::Lorem.sentence }
    shipping_address_id { 3 }
    shipping_date_id { 2 }
    delivery_charge_id { 2 }
    price { '777' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
