# テーブル設計

## users　テーブル

| Column          | Type   | Options     |
| ----------      | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| repassword      | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

## Association
- has_many :items
- has_many :records
- has_one :address


## items　テーブル

| Column              | Type       | Options                          |
| ------------------- | ---------- | -------------------------------- |
| name                | string     | null: false                      |
| text                | string     | null: false                      |
| price               | integer    | null: false                      |
| fee                 | integer    | null: false                      |
| profit              | integer    | null: false                      |
| user                | references | null: false, foreign_key: true   |
| image               | ActiveStorageで実装する為、テーブルにカラムの追加不要|
| category            | ActiveHushで実装する為、テーブルにカラムの追加不要   |
| state               | ActiveHushで実装する為、テーブルにカラムの追加不要   |
| delivery_fee        | ActiveHushで実装する為、テーブルにカラムの追加不要   |
| delivery_prefecture | ActiveHushで実装する為、テーブルにカラムの追加不要   |
| delivery_date       | ActiveHushで実装する為、テーブルにカラムの追加不要   |

## Association
- belongs_to :user (単数形)
- belongs_to :record (単数形)
- has_one :address (単数形)


## records　テーブル

| Column              | Type       | Options                          |
| ------------------- | ---------- | -------------------------------- |
| user                | references | null: false, foreign_key: true   |
| item                | references | null: false, foreign_key: true   |

## Association

- has_many :items
- belongs_to :user (単数形)
- has_one :address (単数形)


## addresses　テーブル

| Column              | Type       | Options                          |
| ------------------- | ---------- | -------------------------------- |
| postcode            | string     | null: false                      |
| prefecture_id       | string     | null: false                      |
| city                | string     | null: false                      |
| bloc                | string     | null: false                      |
| building            | string     | null: false                      |
| tel                 | string     | null: false                      |
| record              | references | null: false, foreign_key: true   |


## Association
- belongs_to :record (単数形)
- belongs_to :item (単数形)
- belongs_to :user(単数形)