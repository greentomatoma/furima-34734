require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do

  describe '配送先住所の保存' do

    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '配送先住所が登録できる時' do
      it '全ての情報が入力されている' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
      it 'postcodeにハイフンを含む半角数字で入力されている' do
        @purchase_address.postcode = '123-4567'
        expect(@purchase_address).to be_valid
      end
      it 'phone_numberは11桁で入力されている' do
        @purchase_address.phone_number = '09012345678'
        expect(@purchase_address).to be_valid
      end
      it 'phone_numberは半角数字で数値のみ入力されている' do
        @purchase_address.phone_number = '09012345678'
        expect(@purchase_address).to be_valid
      end
      it 'user_idが紐づいている' do
        
      end
      it 'item_idが紐づいている' do
      
      end
    end

    context '配送先住所が登録できない時' do
      it 'postcodeが入力されていない' do
        @purchase_address.postcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeにハイフンが含まれていない' do
        @purchase_address.postcode = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postcode Input correctly')
      end
      it 'postcodeが全角数字で入力されている' do
        @purchase_address.postcode = '１２３４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postcode Input correctly')
      end
      it 'region_idが選択されていない' do
        @purchase_address.region_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Region Select')
      end
      it 'cityが入力されていない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが入力されていない' do
        @purchase_address.block = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが入力されていない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字で入力されている' do
        @purchase_address.phone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'user_idが紐づいてない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいてない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
