require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '出品が可能なとき' do
        it 'name,category,status,explain,shipping_address_id,shipping_date_id,delivery_charge_id,price,imageが存在する時出品できる' do
          expect(@item).to be_valid
        end
      end

      context '出品が不可のとき' do
        it 'nameが空だと出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'category_idが選択されていないと出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it 'status_idが選択されていないと出品できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status must be other than 1')
        end
        it 'explainが空だと出品できない' do
          @item.explain = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explain can't be blank")
        end
        it 'shipping_address_idが選択されていないと出品できない' do
          @item.shipping_address_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping address must be other than 1')
        end
        it 'shipping_date_idが選択されていないと出品できない' do
          @item.shipping_date_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping date must be other than 1')
        end
        it 'delivery_charge_idが選択されていないと出品できない' do
          @item.delivery_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery charge must be other than 1')
        end
        it 'priceが空だと出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが¥300未満の時出品できない' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price 価格の範囲は¥300~¥9,999,999の間で設定してください')
        end
        it 'priceが¥9,999,999を超える時出品できない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price 価格の範囲は¥300~¥9,999,999の間で設定してください')
        end
        it 'imageが空だと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
      end
    end
  end
end
