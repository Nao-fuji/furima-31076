# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |


### Association

- has_many :comments
- has_many :items
- has_many :purchases



## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| price               | integer    | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| explain             | text       | null: false                    |
| shipping_address_id | integer    | null: false                    |
| shipping_date_id    | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |


### Association

- has_many :comments
- has_one :purchase
- belongs_to :user



## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item



## purchase テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :address



## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| cities         | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase