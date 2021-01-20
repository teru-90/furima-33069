FactoryBot.define do
  factory :item do
    product_name              { '商品名' }
    text                      { '説明文' }
    price                     { 300 }
    category_id               { 2 }
    state_id                  { 2 }
    delivery_fee_id           { 2 }
    delivery_prefecture_id    { 2 }
    delivery_date_id          { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
