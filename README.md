# テーブル設計

## users テーブル

| Colum      | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| last_name  | string | null: false |
| first_name | string | null: false |
| birthday   | date   | null: false |

### Association

- has_many :items
- has_many :purchase

<br />
<br />

## items テーブル

| Colum           | Type          | Options                        |
| --------------- | ------------- | ------------------------------ |
| name            | string        | null: false                    |
| description     | varchar(1000) | null: false                    |
| category        | string        | null: false                    |
| status          | string        | null: false                    |
| delivery_charge | string        | null: false                    |
| region          | string        | null: false                    |
| delivery_days   | string        | null: false                    |
| price           | integer       | null: false                    |
| user            | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

<br />
<br />

## purchase テーブル

| Colum          | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
 
 ### Association

 - belongs_to :user
 - belongs_to :item
 - has_one :shipping_adress

<br />
<br />

 ## shipping_adress テーブル

| Colum        | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| postcode     | varchar(8)  | null: false                    |
| prefecture   | string      | null: false                    |
| city         | string      | null: false                    |
| block        | string      | null: false                    |
| building     | string      | null: false                    |
| phone_number | integer(11) | null: false                    |
| purchase     | references  | null: false, foreign_key: true |

 ### Association

- belongs_to :purchase