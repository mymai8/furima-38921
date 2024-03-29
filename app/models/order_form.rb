class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }

    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Payment.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, telephone_number: telephone_number)
  end
end