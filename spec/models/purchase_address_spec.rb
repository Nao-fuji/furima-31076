require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    describe '商品購入機能' do
      context '購入ができる時' do 
        it 'postal_code, prefectures_id, cities, address, building_name, phone_number,tokenが存在する時' do 
          expect(@purchase_address).to be_valid
        end
      end

      context '購入できない時' do
        it 'postal_codeが空では購入できない' do 
          @purchase_address.postal_code = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeにはハイフンを使用しなければ購入できない' do 
          @purchase_address.postal_code = "1234567"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code ハイフンを使用してください")
        end
        it 'prefectures_idが空では購入できない' do 
          @purchase_address.prefectures_id = 1
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Prefectures must be other than 1")
        end
        it 'citiesが空では購入できない' do 
          @purchase_address.cities = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Cities can't be blank")
        end
        it 'addressが空では購入できない' do 
          @purchase_address.address = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
        end
        it 'phone_numberが空では購入できない' do 
          @purchase_address.phone_number = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberはハイフンを使用していると購入できない' do 
          @purchase_address.phone_number = "090-1234-5678"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number ハイフンは必要ありません")
        end
        it 'phone_numberは11桁以内でないと購入できない' do 
          @purchase_address.phone_number = "090123456789"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
        end

        it "tokenが空では購入できない" do
          @purchase_address.token = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        end

      end
    end
  end
end
