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
- has_many :orders

## itemsテーブル

| Colum           | Type       | Options                        |
|-----------------|------------|--------------------------------|
| name            | string     | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| price           | integer    | null: false                    |
| comment         | text       | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| schedule_id     | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- has_one :order
- belongs_to :user

## ordersテーブル

| Colum     | Type       | Options                        |
|-----------|------------|--------------------------------|
| user      | references | null: false  foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Colum           | Type       | Options                        |
|-----------------|------------|--------------------------------|
| postalcode_id   | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| municipality    | string     | null: false                    |
| add             | string     | null: false,                   |
| building        | string     |                                |
| tel             | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association

- belongs_to :order