FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefectures_id { 2 }
    cities { '市町村' }
    address { '番地' }
    building_name { '建物名' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
