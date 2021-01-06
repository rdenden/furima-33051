class Item < ApplicationRecord
  with_options presence: true do 
    with_options numericality: { other_than: 0 }  do
      validates :category_id                         
      validates :condition_id                      
      validates :prefecture_id                     
      validates :delivery_fee_id  
      validates :schedule_id
         
    end
    validates :image 
    validates :name
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"},  format:{with: /[0-9]/,message:"is invalid. Input half-width characters."}                        
    validates :comment                                                
    validates :user
  end
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :Condition
  belongs_to_active_hash :Delivery_fee
  belongs_to_active_hash :Prefecture
  belongs_to_active_hash :Schedule
end
