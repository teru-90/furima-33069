require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order,user_id: @user.id,item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it '建物名がなくても保存できること' do
        @order.building = ""
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'tokenが空では登録できないこと' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("カード情報を入力してください")
      end
      it 'user_idが空では登録できないこと' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空では登録できないこと' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Itemを入力してください")
      end
      it '配送先の情報として、郵便番号が空だと保存できないこと' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '配送先の情報として、郵便番号がハイフン(−)を含んでいないとだと保存できないこと' do
        @order.postcode = '0010000'
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号は(−)を入れて7文字で入力してください")
      end
      it '配送先の情報として、都道府県が空だと保存できないこと' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県を入力してください")
      end
      it '配送先の情報として、都道府県のIDが１だと保存できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県は−−以外を選択してください")
      end
      it '配送先の情報として、市区町村が空だと保存できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村を入力してください")
      end
      it '配送先の情報として、番地が空だと保存できないこと' do
        @order.bloc = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end
      it '配送先の情報として電話番号が空だと保存できないこと' do
        @order.phone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end
      it '配送先の情報として電話番号がハイフン(−)を含んでいると保存できないこと' do
        @order.phone = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は半角数字で入力してください")
      end
      it '配送先の情報として電話番号が12桁以上だと保存できないこと' do
        @order.phone = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は(−)を抜いた11桁までを入力してください")
      end
    end
  end
end
