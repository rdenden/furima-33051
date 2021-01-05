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
end
