FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    last_name             {"ぜんかく"}
    first_name            {"ぜんかく"}
    last_name_kana        {Gimei.last.katakana}
    first_name_kana       {Gimei.first.katakana}
    birthday              {Faker::Date.backward}
  end
end

