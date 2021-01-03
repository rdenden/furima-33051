# テーブル設計

## usersテーブル

| Colum           | Type   | Options     |
|-----------------|--------|-------------|
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | date   | null: false |

### Association

- has_many :items
- has_many :buys

## itemsテーブル

| Colum        | Type       | Options                        |
|--------------|------------|--------------------------------|
| name         | string     | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| place        | string     | null: false                    |
| price        | int        | null: false                    |
| comment      | text       | null: false                    |
| delivery_fee | int        | null: false                    |
| schedule     | string     | null: false                    |
| user         | references | null: false, foreign_key: true |


### Association

- has_one :buys
- belongs_to :user

## buysテーブル

| Colum     | Type       | Options                        |
|-----------|------------|--------------------------------|
| user      | references | null: false  foreign_key: true |
| address   | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many :addresses

## addressesテーブル

| Colum        | Type       | Options                        |
|--------------|------------|--------------------------------|
| cord         | string     | null: false                    |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| add          | string     | null: false,                   |
| building     | string     |                                |
| tel          | string     | null: false                    |

### Association

- belongs_to :buy