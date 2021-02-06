# require 'rails_helper'　この記述が,rails_helper.rb(Rspecを使ってテストする時の共通設定を書いておくファイル)を読み込む事でテストが行える。 rails g rspec:model user   %rails gコマンドでテストファイル作ると自動追加される。
require 'rails_helper'

RSpec.describe User, type: :model do
  # FactoryBot.build(:user)という記述によって、設定したインスタンスを生成する。
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カナ)はカタカナを使用して入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)はカタカナを使用して入力してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end

      it 'emailは@を含んでいないと登録できない' do
        @user.email = 'aaaa.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが半角英数混合でなければ登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数混合を使用してください')
      end
      it 'passwordが半角英数混合でなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数混合を使用してください')
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ＡＡＡＡＡＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数混合を使用してください')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '111aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordとpassword_confirmationが一致してないと登録できない' do
        @user.password_confirmation = '111111a'
        @user.password == @user.password_confirmation
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'ユーザー本名（名字）は英語ではできない' do
        @user.last_name = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字は全角文字を使用してください')
      end
      it 'ユーザー本名（名前）は英語ではできない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角文字を使用してください')
      end

      it 'ユーザー本名（カナ名字）は漢字ではできない' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(カナ)はカタカナを使用して入力してください')
      end
      it 'ユーザー本名（カナ名字）は英語ではできない' do
        @user.last_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(カナ)はカタカナを使用して入力してください')
      end

      it 'ユーザー本名（カナ名前）は漢字ではできない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)はカタカナを使用して入力してください')
      end
      it 'ユーザー本名（カナ名前）は英語ではできない' do
        @user.first_name_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)はカタカナを使用して入力してください')
      end
    end
  end
end
