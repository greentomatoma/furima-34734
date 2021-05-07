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
    end

    context '配送先住所が登録できない時' do
      it 'postcodeが入力されていない' do
        @purchase_address.postcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号を入力してください')
      end
      it 'postcodeにハイフンが含まれていない' do
        @purchase_address.postcode = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号はハイフンを含めた半角数字で入力してください')
      end
      it 'postcodeが全角数字で入力されている' do
        @purchase_address.postcode = '１２３４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号はハイフンを含めた半角数字で入力してください')
      end
      it 'region_idが選択されていない' do
        @purchase_address.region_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'cityが入力されていない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('市区町村を入力してください')
      end
      it 'blockが入力されていない' do
        @purchase_address.block = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('番地を入力してください')
      end
      it 'phone_numberが入力されていない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号を入力してください')
      end
      it 'phone_numberが全角数字で入力されている' do
        @purchase_address.phone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は半角数字のみで入力してください')
      end
      it 'phone_numberが12桁以上で入力されている' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は半角数字のみで入力してください')
      end
      it 'phone_numberが英字混合で入力されている' do
        @purchase_address.phone_number = '0901234567a'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は半角数字のみで入力してください')
      end
      it 'user_idが紐づいてない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Userを入力してください')
      end
      it 'item_idが紐づいてない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Itemを入力してください')
      end
      it 'tokenが入力されていない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('クレジット情報を入力してください')
      end
    end
  end
end
