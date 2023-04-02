FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username(specifier: 5..8) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) + '9z' }
    password_confirmation { password }
    lastname              { '山田' }
    firstname             { '太郎' }
    lastname_kana         { 'ヤマダ' }
    firstname_kana        { 'タロウ' }
    birthday              { Faker::Date.birthday }
  end
end
