class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :municipalities, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :municipalities
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/}
    validates :user_id
    validates :item_id
  end
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, shipping_area_id: shipping_area.id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number)
  end
end