# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| lastname           | string | null: false               |
| firstname          | string | null: false               |
| lastname_kana      | string | null: false               |
| firstname_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders



## items テーブル

| Column             | Type       | Options                       |
| ------------------ | -----------| ----------------------------- |
| item_name          | string     | null: false                   |
| explanation        | text       | null: false                   |
| category           | string     | null: false                   |
| condition          | string     | null: false                   |
| delivery_charge    | string     | null: false                   |
| shipping_area      | string     | null: false                   |
| days_to_ship       | string     | null: false                   |
| price              | integer    | null: false                   |
| seller             | string     | null: false                   |
| user_id            | references | null: false, foreign_key: true|
| order_id           | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :order
- has_one_attached :image



## orders テーブル
  
| Column           | Type       | Options                       |
| ---------------- | ---------- | ------------------------------|
| buyer            | string     | null: false                   |
| purchase_goods   | string     | null: false                   |
| user_id          | references | null: false, foreign_key: true|
| item_id          | references | null: false, foreign_key: true|
 
### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ------------------------------|
| post_code          | string     | null: false                   |
| prefectures        | string     | null: false                   |
| municipalities     | string     | null: false                   |
| address            | string     | null: false                   |
| building_name      | string     |                               |
| phone_number       | integer    | null: false                   |
| order_id           | references | null: false, foreign_key: true|

### Association

- belongs_to :order

