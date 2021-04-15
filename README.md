# テーブル設計

## users テーブル

| Colum              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :purchases



## items テーブル

| Colum              | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| name               | string        | null: false                    |
| description        | varchar(1000) | null: false                    |
| category_id        | string        | null: false                    |
| status_id          | string        | null: false                    |
| delivery_charge_id | string        | null: false                    |
| region_id          | string        | null: false                    |
| delivery_days_id   | string        | null: false                    |
| price              | integer       | null: false                    |
| user               | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase



## purchase テーブル

| Colum          | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
 
 ### Association

 - belongs_to :user
 - belongs_to :item
 - has_one :shipping_adress



 ## shipping_adress テーブル

| Colum        | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| postcode     | varchar(8)  | null: false                    |
| prefecture   | string      | null: false                    |
| city         | string      | null: false                    |
| block        | string      | null: false                    |
| building     | string      |                                |
| phone_number | integer(11) | null: false                    |
| purchase     | references  | null: false, foreign_key: true |

 ### Association

- belongs_to :purchase