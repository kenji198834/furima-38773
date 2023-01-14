#テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ----    | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           |  date   | null: false | 

### Association
has_many :items
has_many :orders
has_many :comments

## items テーブル

| Column           | Type       | Options     | 
| ---------------- | -----------| -------     |
| user             | references | null: false, foreign_key: true|
| name             | string     | null: false |
| description      | text       | null: false |
| category_id      | integer    | null: false |
| item_status_id   | integer    | null: false |
| shipping_cost_id | integer    | null: false |
| prefecture_id    | integer    | null: false |
| shipping_date_id | integer    | null: false |
| price            | integer    | null: false |

### Association
belongs_to :user
has_one :order
has_many :comments
has_one_attached :image

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :payment

## payments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postcode      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | ------------------------------ |
| phone_number  | string     | null: false                    |

### Association
belongs_to :order

## comments テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| text    | text       | null: false                    |

### Association

belongs_to :user
belongs_to :item

## active_storage_attachments　 テーブル

| Column      | Type    | Options     | 
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| record-type | string  | null: false |
| record_id   | integer | null: false |
| blob_id     | integer | null: false |

## active_storage_blobs テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| key          | string  | null: false |
| filename     | string  | null: false |
| content_type | string  | null: false |
| metadata     | string  | null: false |
| byte_size    | integer | null: false |
| checksum     | string  | null: false |