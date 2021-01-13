FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = 'a1' + Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    birth_date { Faker::Date.backward }

    transient do
      person { Gimei.name }
    end

    first_name { person.first.kanji }
    last_name { person.last.kanji }
    first_name_kana { person.first.katakana }
    last_name_kana { person.last.katakana }
   
  end
end
