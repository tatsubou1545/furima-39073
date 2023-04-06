FactoryBot.define do
  factory :order_address do
    post_code              { '123-4567' }
    shipping_area_id       { '2' }
    municipalities         { '渋谷区' }
    address                { '青山通り' }
    building_name          { 'アジアビルディング9F' }
    phone_number           { '09012345678' }
    token                  { 'tok_abcdefghijk00000000000000000' }
  end
end
