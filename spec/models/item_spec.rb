require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '新規出品' do
      context '出品がうまくいくとき' do
        it 'name,category_id,condition_id,prefecture_id,price,comment,delivery_fee_id,schdule_id,user_id,imageが存在すれば登録できること' do
          expect(@item).to be_valid
        end
      end

      context '出品がうまくいかないとき' do
        it 'nameが空では登録できないこと' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'category_idが空では登録できないこと' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
        end
        it 'condition_idが空では登録できないこと' do
          @item.condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank", 'Condition is not a number')
        end
        it 'prefecture_idが空では登録できないこと' do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
        end
        it 'priceが空では登録できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'commentが空では登録できないこと' do
          @item.comment = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Comment can't be blank")
        end
        it 'delivery_fee_idが空では登録できないこと' do
          @item.delivery_fee_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank", 'Delivery fee is not a number')
        end
        it 'schdule_idが空では登録できないこと' do
          @item.schedule_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Schedule can't be blank", 'Schedule is not a number')
        end
        it 'user_idが空では登録できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User can't be blank", 'User must exist')
        end
        it 'imageが空では登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'priceが300未満では登録できないこと' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of setting range')
        end
        it 'priceが9999999超では登録できないこと' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of setting range')
        end
        it 'category_idが0では登録できないこと' do
          @item.category_id = '0'
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 0')
        end
        it 'condition_idが0では登録できないこと' do
          @item.condition_id = '0'
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition must be other than 0')
        end
        it 'prefecture_idが0では登録できないこと' do
          @item.prefecture_id = '0'
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
        end
        it 'delivery_fee_idが0では登録できないこと' do
          @item.delivery_fee_id = '0'
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery fee must be other than 0')
        end
        it 'schdule_idが0では登録できないこと' do
          @item.schedule_id = '0'
          @item.valid?
          expect(@item.errors.full_messages).to include('Schedule must be other than 0')
        end
        it 'priceが漢字では登録できないこと' do
          @item.price = '阿'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of setting range')
        end
        it 'priceがひらがなでは登録できないこと' do
          @item.price = 'あ'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of setting range')
        end
        it 'priceがカタカナでは登録できないこと' do
          @item.price = 'ア'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of setting range')
        end
        it 'priceが全角英字では登録できないこと' do
          @item.price = 'ａ'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of setting range')
        end
        it 'priceが半角英字では登録できないこと' do
          @item.price = 'a'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of setting range')
        end
      end
    end
  end
end
