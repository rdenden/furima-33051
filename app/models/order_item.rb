class OrderItem
  include ActiveModel::Model
  attr_accessor :user, :item, :order, :postalcode_id, :prefecture_id, :municipality, :add, :building, :tel
  
  with_options presence: true do
    validates :postalcode_id, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }    
    validates :municipality
    validates :add
    validates :tel , format: { with: /\A\d{10,11}\z/ }
    validates :user
    validates :item
    validates :order
  end
  validates :prefecture_id, numericality: { other_than: 0 }
  

  def save
    Address.create(postalcode_id: postalcode_id, prefecture_id: prefecture_id, municipality: municipality, add: add, building: building, tel: tel)
    Buy.create(item_id: params[:id], user_id: current.user.id)
  end



end