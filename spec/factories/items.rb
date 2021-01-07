FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    category_id { 1 }
    condition_id { 1 }
    prefecture_id { 1 }
    price { 300 }
    comment { Faker::Lorem.sentence }
    delivery_fee_id { 1 }
    schedule_id { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
