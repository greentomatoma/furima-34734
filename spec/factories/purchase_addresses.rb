FactoryBot.define do
  factory :purchase_address do
    postcode { '123-4567' }
    region_id { Faker::Number.between(from: 1, to: 48) }
    city { '大阪府' }
    block { 'なにわ1-1-1' }
    building { '建物名' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
