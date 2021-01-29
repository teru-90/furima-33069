FactoryBot.define do
  factory :order do
    postcode                  { '000-0001' }
    prefecture_id             { 2 }
    city                      { '札幌市' }
    bloc                      { 1 }
    building                  { 1 }
    phone                     { '09012345678' }
    token                     { 'tok_abcdefghijk00000000000000000' }
  end
end
