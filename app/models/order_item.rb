class OrderItem
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postalcode_id, :prefecture_id, :municipality, :add, :building, :tel, :token

  with_options presence: true do
    validates :postalcode_id, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality
    validates :add
    validates :tel, format: { with: /\A\d{,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(postalcode_id: postalcode_id, prefecture_id: prefecture_id, municipality: municipality, add: add,
                   building: building, tel: tel, order_id: order.id)
  end
end
