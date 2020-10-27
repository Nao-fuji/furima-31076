require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいく時' do
        it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが全て存在すれば登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordが6文字以上で登録できる' do
          @user.password = 'abc000'
          @user.password_confirmation = 'abc000'
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空だと登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'emailが重複していると登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailに@を使用していないと登録できない' do
          @user.email = 'hogehoge'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'passwordが空だと登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'password_confirmationがpasswordと一致していなければ登録できない' do
          @user.password = 'abc000'
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordが5文字以下だと登録できない' do
          @user.password = 'abc00'
          @user.password_confirmation = 'abc00'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordが半角英数字で入力されていないと登録できない' do
          @user.password = '000000'
          @user.password_confirmation = '000000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
        end
        it 'last_nameが空だと登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'last_nameが全角（漢字、ひらがな、カタカナ）で入力されていないと登録できない' do
          @user.last_name = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
        end
        it 'first_nameが空だと登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'first_nameが全角（漢字、ひらがな、カタカナ）で入力されていないと登録できない' do
          @user.first_name = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
        end
        it 'last_name_kanaが空だと登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it 'last_name_kanaが全角（カタカナ）で入力されていないと登録できない' do
          @user.last_name_kana = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana 全角カナを使用してください')
        end
        it 'first_name_kanaが空だと登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'first_name_kanaが全角（カタカナ）で入力されていないと登録できない' do
          @user.first_name_kana = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana 全角カナを使用してください')
        end
        it 'birthdayが空だと登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end
