require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる時' do
      it '入力欄に全て入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれている' do
        @user.email = 'aaa@aaa.com'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上で半角英数字が混合されていれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）で入力されている' do
        @user.last_name = 'あいうえお'
        expect(@user).to be_valid
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）で入力されている' do
        @user.first_name = 'あいうえお'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角（カタカナ）で入力されている' do
        @user.last_name = 'アイウエオ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角（カタカナ）で入力されている' do
        @user.first_name = 'アイウエオ'
        expect(@user).to be_valid
      end
      it '生年月日が入力されている' do
        @user.birthday = '2000-01-01'
        expect(@user).to be_valid
      end
    end


    context '新規登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がついていなければ登録できない' do
        @user.email = 'aaa.aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = '000000'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが6文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationが数字のみだと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordとpassword_confirmationが英字のみだと登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordとpassword_confirmationが全角だと登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationの値が一致していなければ登録できない' do
        @user.password = '111aaa0'
        @user.password_confirmation = '111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）で入力されていない' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）で入力されていない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaが全角（カタカナ）で入力されていない' do
        @user.last_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end
      it 'first_name_kanaが全角（カタカナ）で入力されていない' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end