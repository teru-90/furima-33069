# アプリケーション名
furima-33069

# アプリケーション概要
フリマアプリのクローンサイトです。誰でも簡単に売り買いが楽しめるように、ユーザー登録・商品出品・商品購入などの機能を再現していますが、実際の取引はできません。

# URL
https://furima-33069.herokuapp.com/

# テスト用アカウント
Basic認証　ユーザー名：admin パスワード：2222
ログインメールアドレス：test0@gmail.com　パスワード：1111aaaa
購入者用メール：test@gmail.com　パスワード：1111aaaa

# 利用方法
# 目指した課題解決
# 洗い出した要件
# 実装した機能についての説明
・　Deviseを用いたユーザー登録フォーム
・　Javascriptを使用した非同期処理
・　プレビュー機能
・　複数枚画像投稿機能
・　pay.jpによる購入処理
・　capistranoを使ったAWS・EC2への自動デプロイ
・　ActiveStorageを使用したAWS・S3への画像アップロード
・　RSpecを使った単体テスト

# ローカルでの動作方法
・ruby 2.6.5
・Rails 6.0.3.4

% https://github.com/teru-90/furima-33069.git
% cd furima-333069
% bundle install

# テーブル設計

## users　テーブル

| Column             | Type   | Options                   |
| ----------         | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

## Association
- has_many :items
- has_many :records


## items　テーブル

| Column                 | Type       | Options                          |
| ---------------------- | ---------- | -------------------------------- |
| product_name           | string     | null: false                      |
| text                   | text       | null: false                      |
| price                  | integer    | null: false                      |　
| user                   | references | null: false, foreign_key: true   |
| category_id            | integer    | null: false                      |ActiveHushで実装する
| state_id               | integer    | null: false                      |ActiveHushで実装する
| delivery_fee_id        | integer    | null: false                      |ActiveHushで実装する
| delivery_prefecture_id | integer    | null: false                      |ActiveHushで実装する
| delivery_date_id       | integer    | null: false                      |ActiveHushで実装する

## Association
- has_one_attached :image
- belongs_to :user (単数形)
- has_one :record (単数形)


## records　テーブル

| Column              | Type       | Options                          |
| ------------------- | ---------- | -------------------------------- |
| user                | references | null: false, foreign_key: true   |
| item                | references | null: false, foreign_key: true   |

## Association

- belongs_to :item (単数形)
- belongs_to :user (単数形)
- has_one :address (単数形)


## addresses　テーブル

| Column              | Type       | Options                          |
| ------------------- | ---------- | -------------------------------- |
| postcode            | string     | null: false                      |
| prefecture_id       | integer    | null: false                      |
| city                | string     | null: false                      |
| bloc                | string     | null: false                      |
| building            | string     |                                  |
| phone               | string     | null: false                      |
| record              | references | null: false, foreign_key: true   |


## Association
- belongs_to :record (単数形)
