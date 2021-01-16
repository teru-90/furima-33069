FactoryBot.define do
  factory :user do
    nickname                { 'タロウ' }
    email                   { Faker::Internet.free_email }
    password                { '000000a' }
    password_confirmation   { password }
    last_name               { '山田' }
    first_name              { '太郎' }
    last_name_kana          { 'ヤマダ' }
    first_name_kana         { 'タロウ' }
    birthday                { '1999-01-01}' }
  end
end
