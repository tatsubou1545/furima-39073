FactoryBot.define do
  factory :item do
    item_name              { Faker::Commerce.product_name }
    explanation            { Faker::Lorem.sentence }
    category_id            { Category.find_by(name: 'メンズ').id }
    condition_id           { Condition.find_by(name: '新品・未使用').id }
    delivery_charge_id     { DeliveryCharge.find_by(name: '送料込み(出品者負担)').id }
    shipping_area_id       { ShippingArea.find_by(name: '東京都').id }
    days_to_ship_id        { DaysToShip.find_by(name: '1~2日で発送').id }
    price                  { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/picture.png'), filename: 'picture.png')
    end
  end
end
