class Item < ApplicationRecord
  with_options presence: true do 
    with_options numericality: { other_than: 0 }  do
      validates :category_id                         
      validates :condition_id                      
      validates :prefecture_id                     
      validates :delivery_fee_id  
      validates :schedule_id    
    end
    
    validates :name
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "300~9,999,999までの金額を入力してください"},  format:{with: /[0-9]/,message:"半角数字を入力してください"}                        
    validates :comment                                                
    validates :user, foreign_key: true 
  end
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :Condition
  belongs_to :Delivery_fee
  belongs_to :Prefecture
  belongs_to :Schedule
end
