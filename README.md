# テーブル設計

## usersテーブル

| Colum               | Type   | Options                   |
|---------------------|--------|---------------------------|
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| last_name           | string | null: false               |
| first_name          | string | null: false               |
| last_name_kana      | string | null: false               |
| first_name_kana     | string | null: false               |
| birth_date          | date   | null: false               |

### Association

- has_many :items
- has_many :buys

## itemsテーブル

| Colum           | Type       | Options                        |
|-----------------|------------|--------------------------------|
| name            | string     | null: false                    |
| category        | string     | null: false                    |
| condition_id    | integer    | null: false                    |
| place_id        | integer    | null: false                    |
| price           | integer    | null: false                    |
| comment         | text       | null: false                    |
| delivery_fee-id | integer    | null: false                    |
| schedule_id     | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- has_one :buy
- belongs_to :user

## buysテーブル

| Colum     | Type       | Options                        |
|-----------|------------|--------------------------------|
| user      | references | null: false  foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresses

## addressesテーブル

| Colum           | Type       | Options                        |
|-----------------|------------|--------------------------------|
| cord_id         | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| municipality    | string     | null: false                    |
| add             | string     | null: false,                   |
| building        | string     |                                |
| tel             | string     | null: false                    |
| buy             | references | null: false, foreign_key: true |

### Association

- belongs_to :buy