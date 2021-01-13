FactoryBot.define do
  factory :order_item do
    postalcode_id { '111-1111' }
    prefecture_id { 1 }
    municipality { '横浜市' }
    add { '1-1' }
    tel { '01234567890' }
    building { 'ビル' }
    token { 'tok_abcdefghijk00000000000000000' }
   
  end
end
