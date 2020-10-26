# テーブル設計

## users テーブル

| Column                 | Type    | Options     |
| ---------------------- | ------- | ----------- |
| nickname               | string  | null: false |
| email                  | string  | null: false |
| password               | string  | null: false |
| last_name(full-width)  | string  | null: false |
| first_name(full-width) | string  | null: false |
| last_name(kana)        | string  | null: false |
| first_name(kana)       | string  | null: false |
| birthday_year          | integer | null: false |
| birthday_month         | integer | null: false |
| birthday_day           | integer | null: false |


### Association

- has_many :comments
- has_many :items
- has_many :purchase



## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| explain          | string     | null: false                    |
| shipping_address | string     | null: false                    |
| shipping_date    | integer    | null: false                    |
| delivery_charge  | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| purchase         | references | null: false, foreign_key: true |


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
| when    | integer    | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :address



## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| cities        | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase