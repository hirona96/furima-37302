require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it 'nameとinfo、category_id、sales_status_id、shipping_fee_status_id、prefecture_id、scheduled_delivery_id、price、imageがあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'infoが空では出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end
      it 'category_idが空では出品できない' do
        @item.category_id = { id: 1 }
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'sales_status_idが空では出品できない' do
        @item.sales_status_id = { id: 1 }
        @item.valid?
        expect(@item.errors.full_messages).to include "Sales status can't be blank"
      end
      it 'shipping_fee_status_idが空では出品できない' do
        @item.shipping_fee_status_id = { id: 1 }
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee status can't be blank"
      end
      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = { id: 1 }
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'scheduled_delivery_idが空では出品できない' do
        @item.scheduled_delivery_id = { id: 1 }
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled delivery can't be blank"
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'priceが数値以外では出品できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters'
      end
      it 'priceが300円以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it 'priceが9,999,999円以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
