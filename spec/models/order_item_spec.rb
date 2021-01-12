require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe '#create' do
    before do
      @order_item = FactoryBot.build(:order_item)
    end

    describe '商品購入' do
      context '購入がうまくいくとき' do
        it 'postalcode_id,prefecture_id,municipality, add, building,tel,user_id,item_id,tokenが存在すれば登録できること' do
          expect(@order_item).to be_valid
        end
        it 'buildingはなくても登録できること' do
          @order_item.building = nil
          expect(@order_item).to be_valid
        end        
      end

      context '購入がうまくいかないとき' do
        it 'postalcode_idが空では登録できないこと' do
          @order_item.postalcode_id = nil
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include("Postalcode can't be blank", "Postalcode is invalid. Include hyphen(-)")
        end
        it 'prefecture_idが空では登録できないこと' do
          @order_item.prefecture_id = nil
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include('Prefecture is not a number')
        end
        it 'municipality_idが空では登録できないこと' do
          @order_item.municipality = nil
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include("Municipality can't be blank")
        end
        it 'addが空では登録できないこと' do
          @order_item.add = nil
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include("Add can't be blank")
        end
        it 'telが空では登録できないこと' do
          @order_item.tel = nil
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include("Tel can't be blank")
        end
        it 'user_idが空では登録できないこと' do
          @order_item.user_id = nil
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空では登録できないこと' do
          @order_item.item_id = nil
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include("Item can't be blank")
        end
        it 'tokenが空では登録できないこと' do
          @order_item.token = nil
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include("Token can't be blank")
        end
        it 'postalcode_idはハイフンがなければ登録できないこと' do
          @order_item.postalcode_id = '1111111'
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include("Postalcode is invalid. Include hyphen(-)")
        end
        it 'postalcode_idのハイフンは,先頭から４番目以外に存在すれば登録できないこと' do
          @order_item.postalcode_id = '1111-111'
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include("Postalcode is invalid. Include hyphen(-)")
        end
        it 'prefecture_idが0では登録できないこと' do
          @order_item.prefecture_id = '0'
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include('Prefecture must be other than 0')
        end
        
        it 'telはハイフンが入っていると登録できないこと' do
          @order_item.tel = '11-1111-1111'
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include("Tel is invalid")
        end
        it 'telは12文字以上では登録できないこと' do
          @order_item.tel = '111111111111'
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include("Tel is invalid")
        end
        





        
#         it 'telが空では登録できないこと' do
#           @order_item.tel = nil
#           @order_item.valid?
#           expect(@order_item.errors.full_messages).to include("Tel can't be blank")
#         end
#         it 'user_idが空では登録できないこと' do
#           @item.user = nil
#           @item.valid?
#           expect(@item.errors.full_messages).to include("User can't be blank", 'User must exist')
#         end
#         it 'imageが空では登録できないこと' do
#           @item.image = nil
#           @item.valid?
#           expect(@item.errors.full_messages).to include("Image can't be blank")
#         end
#         it 'priceが300未満では登録できないこと' do
#           @item.price = '299'
#           @item.valid?
#           expect(@item.errors.full_messages).to include('Price is out of setting range')
#         end
#         it 'priceが9999999超では登録できないこと' do
#           @item.price = '10000000'
#           @item.valid?
#           expect(@item.errors.full_messages).to include('Price is out of setting range')
#         end
#         it 'category_idが0では登録できないこと' do
#           @item.category_id = '0'
#           @item.valid?
#           expect(@item.errors.full_messages).to include('Category must be other than 0')
#         end
#         it 'condition_idが0では登録できないこと' do
#           @item.condition_id = '0'
#           @item.valid?
#           expect(@item.errors.full_messages).to include('Condition must be other than 0')
#         end
#         it 'prefecture_idが0では登録できないこと' do
#           @item.prefecture_id = '0'
#           @item.valid?
#           expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
#         end
#         it 'delivery_fee_idが0では登録できないこと' do
#           @item.delivery_fee_id = '0'
#           @item.valid?
#           expect(@item.errors.full_messages).to include('Delivery fee must be other than 0')
#         end
#         it 'schdule_idが0では登録できないこと' do
#           @item.schedule_id = '0'
#           @item.valid?
#           expect(@item.errors.full_messages).to include('Schedule must be other than 0')
#         end
#         it 'priceが漢字では登録できないこと' do
#           @item.price = '阿'
#           @item.valid?
#           expect(@item.errors.full_messages).to include('Price is out of setting range')
#         end
#         it 'priceがひらがなでは登録できないこと' do
#           @item.price = 'あ'
#           @item.valid?
#           expect(@item.errors.full_messages).to include('Price is out of setting range')
#         end
#         it 'priceがカタカナでは登録できないこと' do
#           @item.price = 'ア'
#           @item.valid?
#           expect(@item.errors.full_messages).to include('Price is out of setting range')
#         end
#         it 'priceが全角英字では登録できないこと' do
#           @item.price = 'ａ'
#           @item.valid?
#           expect(@item.errors.full_messages).to include('Price is out of setting range')
#         end
#         it 'priceが半角英字では登録できないこと' do
#           @item.price = 'a'
#           @item.valid?
#           expect(@item.errors.full_messages).to include('Price is out of setting range')
#         end
      end
    end
  end
end
