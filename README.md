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
| tel                 | string     | null: false                      |
| record              | references | null: false, foreign_key: true   |


## Association
- belongs_to :record (単数形)