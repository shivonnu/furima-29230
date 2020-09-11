# テーブル設計

## Users テーブル

| column          | Type   | Options     |
|-----------------|--------|-------------|
| nickname        | string | null: false |
| mail_address    | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| fast_name_kana  | string | null: false |
| birthday        | date   | null: false |


### Association

- has_many   :products
- has_many   :purchases

## Products テーブル

| column               | Type    | Options                        |
|----------------------|---------|--------------------------------|
| name                 | string  | null: false                    |
| description          | text    | null: false                    |
| category             | integer | null: false                    |
| status               | integer | null: false                    |
| price                | integer | null: false                    |
| users_id             | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :shipping _address
- belongs_to :purchase

## Shipping_address テーブル

| column               | Type    | Options                        |
|----------------------|---------|--------------------------------|
| postal_code          | string  | null: false                    |
| prefectures          | integer | null: false                    |
| city                 | string  | null: false                    |
| address              | string  | null: false                    |
| building_name        | string  |                                |
| phone_number         | string  |                                |

### Association

- has_many   :products
- belongs_to :purchase

## Purchase テーブル

| column               | Type    | Options                        |
|----------------------|---------|--------------------------------|
| users_id             | integer | null: false, foreign_key: true |
| products_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :products
- belongs_to :shipping_address


