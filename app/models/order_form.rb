class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は不正な値です。ハイフンを含めてください' }
    validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'は不正な値です' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Payment.create(order_id: order.id, postcode: postcode, prefecture_id: prefecture_id, city: city, address: address,
                   building_name: building_name, phone_number: phone_number)
  end
end
