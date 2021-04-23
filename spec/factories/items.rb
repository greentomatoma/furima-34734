FactoryBot.define do
  factory :item do
    name               { Faker::Lorem.sentence }
    description        { Faker::Lorem.sentence }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id        { Faker::Number.between(from: 1, to: 11) }
    status_id          { Faker::Number.between(from: 1, to: 7) }
    delivery_charge_id { Faker::Number.between(from: 1, to: 3) }
    region_id          { Faker::Number.between(from: 1, to: 11) }
    delivery_days_id   { Faker::Number.between(from: 1, to: 48) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
