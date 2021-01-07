require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_dateが存在すれば登録できること' do
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上で、かつ半角英数字混合であれば登録できること' do
          @user.password = '111aaa'
          @user.password_confirmation = '111aaa'
          expect(@user).to be_valid
        end
        it 'last_nameが全角漢字で登録できること' do
          @user.last_name = '阿'
          @user.valid?
          expect(@user).to be_valid
        end

        it 'last_nameが全角ひらがなで登録できること' do
          @user.last_name = 'あ'
          @user.valid?
          expect(@user).to be_valid
        end

        it 'last_nameが全角カタカナで登録できること' do
          @user.last_name = 'ア'
          @user.valid?
          expect(@user).to be_valid
        end

        it 'first_nameが全角漢字で登録できること' do
          @user.first_name = '阿'
          @user.valid?
          expect(@user).to be_valid
        end

        it 'first_nameが全角ひらがなで登録できること' do
          @user.last_name = 'あ'
          @user.valid?
          expect(@user).to be_valid
        end

        it 'first_nameが全角カタカナで登録できること' do
          @user.last_name = 'ア'
          @user.valid?
          expect(@user).to be_valid
        end

        it 'last_name_kanaが全角カタカナで登録できること' do
          @user.last_name_kana = 'ア'
          @user.valid?
          expect(@user).to be_valid
        end

        it 'first_name_kanaが全角カタカナで登録できること' do
          @user.last_name_kana = 'ア'
          @user.valid?
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'emailが空では登録できないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it '＠を含まないメールアドレスでは、登録できないこと' do
          @user.email = 'testexample'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it 'nisknameが空では登録できないこと' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'passwordが空では登録できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = '111aa'
          @user.password_confirmation = '111aa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordが6文字以上で、半角英字のみでは登録できないこと' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordが6文字以上で、半角数字のみでは登録できないこと' do
          @user.password = '111111'
          @user.password_confirmation = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = '222aaa'
          @user.password_confirmation = '333aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'last_nameが空では登録できないこと' do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name Full-width characters')
        end

        it 'first_nameが空では登録できないこと' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank", 'First name Full-width characters')
        end

        it 'last_name_kanaが空では登録できないこと' do
          @user.last_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank",
                                                        'Last name kana Full-width katakana characters')
        end

        it 'first_name_kanaが空では登録できないこと' do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank",
                                                        'First name kana Full-width katakana characters')
        end

        it 'last_nameが全角英字で登録できないこと' do
          @user.last_name = 'ａａ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name Full-width characters')
        end

        it 'last_nameが全角数字で登録できないこと' do
          @user.last_name = '１１'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name Full-width characters')
        end

        it 'first_nameが全角英字で登録できないこと' do
          @user.first_name = 'ａａ'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name Full-width characters')
        end

        it 'first_nameが全角数字で登録できないこと' do
          @user.first_name = '１１'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name Full-width characters')
        end

        it 'last_name_kanaが全角英字で登録できないこと' do
          @user.last_name_kana = 'ａａ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
        end

        it 'last_name_kanaが全角数字で登録できないこと' do
          @user.last_name_kana = '１１'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
        end

        it 'first_name_kanaが全角英字で登録できないこと' do
          @user.first_name_kana = 'ａａ'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
        end

        it 'first_name_kanaが全角数字で登録できないこと' do
          @user.first_name_kana = '１１'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
        end

        it 'first_nameが半角英字で登録できないこと' do
          @user.first_name = 'aa'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name Full-width characters')
        end

        it 'first_nameが半角数字で登録できないこと' do
          @user.first_name = '11'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name Full-width characters')
        end

        it 'last_name_kanaが半角英字で登録できないこと' do
          @user.last_name_kana = 'aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
        end

        it 'last_name_kanaが半角数字で登録できないこと' do
          @user.last_name_kana = '111'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
        end

        it 'first_name_kanaが半角英字で登録できないこと' do
          @user.first_name_kana = 'aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
        end

        it 'first_name_kanaが半角数字で登録できないこと' do
          @user.first_name_kana = '111'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
        end

        it 'last_name_kanaが漢字で登録できないこと' do
          @user.last_name_kana = '阿'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
        end

        it 'last_name_kanaがひらがなで登録できないこと' do
          @user.last_name_kana = 'あ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
        end

        it 'first_name_kanaが漢字で登録できないこと' do
          @user.first_name_kana = '阿'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
        end

        it 'first_name_kanaがひらがなで登録できないこと' do
          @user.first_name_kana = 'あ'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
        end

        it 'birth_dateが空では登録できない' do
          @user.birth_date = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
      end
    end
  end
end
