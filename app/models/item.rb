class Item < ApplicationRecord
  with_options presence: true do
    validates :name                
    validates :category_id                         
    validates :condition_id                      
    validates :prefecture_id                     
    validates :price                              
    validates :comment                            
    validates :delivery_fee_id                    
    validates :schedule_id                       
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
