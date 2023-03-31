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

| Column                | Type       | Options                       |
| --------------------- | -----------| ----------------------------- |
| item_name             | string     | null: false                   |
| explanation           | text       | null: false                   |
| category_id           | integer    | null: false                   |
| condition_id          | integer    | null: false                   |
| delivery_charge_id    | integer    | null: false                   |
| shipping_area_id      | integer    | null: false                   |
| days_to_ship_id       | integer    | null: false                   |
| price                 | integer    | null: false                   |
| user                  | references | null: false, foreign_key: true|
| order                 | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :order
- has_one_attached :image



## orders テーブル
  
| Column           | Type       | Options                       |
| ---------------- | ---------- | ------------------------------|
| user             | references | null: false, foreign_key: true|
| item             | references | null: false, foreign_key: true|
 
### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ------------------------------|
| post_code          | string     | null: false                   |
| shipping_area_id   | integer    | null: false                   |
| municipalities     | string     | null: false                   |
| address            | string     | null: false                   |
| building_name      | string     |                               |
| phone_number       | string     | null: false                   |
| order              | references | null: false, foreign_key: true|

### Association

- belongs_to :order

