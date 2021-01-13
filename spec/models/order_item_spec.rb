require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @order_item = FactoryBot.build(:order_item, item_id: @item.id , user_id: @user.id)
      sleep 0.2
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
          expect(@order_item.errors.full_messages).to include("Postalcode can't be blank",
                                                              'Postalcode is invalid. Include hyphen(-)')
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
          expect(@order_item.errors.full_messages).to include('Postalcode is invalid. Include hyphen(-)')
        end
        it 'postalcode_idのハイフンは,先頭から４番目以外に存在すれば登録できないこと' do
          @order_item.postalcode_id = '1111-111'
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include('Postalcode is invalid. Include hyphen(-)')
        end
        it 'prefecture_idが0では登録できないこと' do
          @order_item.prefecture_id = 0
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include('Prefecture must be other than 0')
        end

        it 'telはハイフンが入っていると登録できないこと' do
          @order_item.tel = '11-1111-1111'
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include('Tel is invalid')
        end
        it 'telは12文字以上では登録できないこと' do
          @order_item.tel = '111111111111'
          @order_item.valid?
          expect(@order_item.errors.full_messages).to include('Tel is invalid')
        end

        
      end
    end
  end
end
