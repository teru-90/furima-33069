require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do
      it 'product_name,text,price,category_id,state_id,delivery_fee_id,delivery_prefecture_id,delivery_date_id が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品登録がうまくいかないとき' do
      it '画像が空だと登録できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空だと登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空だと登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("テキストを入力してください")
      end
      it 'カテゴリーが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'カテゴリーが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは−−以外を選択してください")
      end
      it '商品の状態が空だと登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it '商品の状態が1だと登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は−−以外を選択してください")
      end
      it '配送料が空だと登録できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it '配送料が1だと登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は−−以外を選択してください")
      end
      it '配送元の地域が空だと登録できない' do
        @item.delivery_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を入力してください")
      end
      it '配送元の地域が1だと登録できない' do
        @item.delivery_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域は−−以外を選択してください")
      end
      it '発送までの日数が空だと登録できない' do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数を入力してください")
      end
      it '発送までの日数が1だと登録できない' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数は−−以外を選択してください")
      end
      it '価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it '価格範囲が300未満は登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は半角数字で300円以上9,999,999円以下で入力して下さい")
      end
      it '価格範囲が9,999,999より大きいと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は半角数字で300円以上9,999,999円以下で入力して下さい")
      end
      it '価格は半角数字でないければ登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は半角数字で300円以上9,999,999円以下で入力して下さい")
      end
    end
  end
end
