FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password = '1a' + Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    last_name             {"ぜんかく"}
    first_name            {"ぜんかく"}
    last_name_kana        {"ゼンカク"}
    first_name_kana       {"ゼンカク"}
    birthday              {Faker::Date.backward}
  end
end

