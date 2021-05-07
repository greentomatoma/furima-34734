require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
    sleep(0.1)
  end

  describe '商品出品' do
    context '商品の出品ができる時' do
      it '全てのデータが入力されている' do
        expect(@item).to be_valid
      end
      it '出品画像が１枚添付されている' do
        expect(@item).to be_valid
      end
      it '商品名が40文字以内で入力されている' do
        @item.name = 'あ' * 40
        expect(@item).to be_valid
      end
      it '商品の説明が1000文字以内で入力されている' do
        @item.description = 'あ' * 1000
        expect(@item).to be_valid
      end
      it 'カテゴリーの選択がされている' do
        @item.category_id = 1
        expect(@item).to be_valid
      end
      it '商品の状態の状態についての情報が選択されている' do
        @item.status_id = 1
        expect(@item).to be_valid
      end
      it '配送料の負担についての情報が選択されている' do
        @item.delivery_charge_id = 1
        expect(@item).to be_valid
      end
      it '発送元の地域についての情報が選択されている' do
        @item.region_id = 1
        expect(@item).to be_valid
      end
      it '発送までの日数についての情報が選択されている' do
        @item.delivery_days_id = 1
        expect(@item).to be_valid
      end
      it '販売価格の入力がされている' do
        @item.price = 123_450
        expect(@item).to be_valid
      end
      it '販売価格が、¥300以上で入力されている' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '販売価格が、¥9,999,999以下で入力されている' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
      it '販売価格が半角数字で入力されている' do
        @item.price = 123_450
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない時' do
      it '出品画像が添付されていない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end
      it '商品名が入力されていない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it '商品名が41文字以上で入力されている' do
        @item.name = 'あ' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名は40文字以内で入力してください')
      end
      it '商品の説明が入力されていない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it '商品の説明が1001文字以上で入力されている' do
        @item.description = 'あ' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明は1000文字以内で入力してください')
      end
      it 'カテゴリーの選択がされていない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it '商品の状態の状態についての情報が選択されていない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it '配送料の負担についての情報が選択されていない' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it '発送元の地域についての情報が選択されていない' do
        @item.region_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it '発送までの日数についての情報が選択されていない' do
        @item.delivery_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it '販売価格の入力がされていない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を入力してください')
      end
      it '販売価格が、¥300以上で入力されていない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end
      it '販売価格が、¥9,999,999以内で入力されていない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
      end
      it '販売価格が半角数字で入力されていない' do
        @item.price = '１２３４５０'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
    end
  end
end
