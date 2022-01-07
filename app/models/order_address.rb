class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
  end

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only number' }



  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
