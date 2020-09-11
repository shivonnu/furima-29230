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
- belongs_to :purchase

## Products テーブル

| column               | Type    | Options                        |
|----------------------|---------|--------------------------------|
| product_name         | string  | null: false                    |
| product_description  | text    | null: false                    |
| category             | string  | null: false                    |
| product_status       | integer | null: false                    |
| price                | integer | null: false                    |
| users_id             | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :delivery_information
- belongs_to :shipping _address

## Delivery_information テーブル

| column               | Type    | Options                        |
|----------------------|---------|--------------------------------|
| shipping_area        | integer | null: false                    |
| shipping_fee_burden  | integer | null: false                    |
| days_to_ship         | integer | null: false                    |
| products_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :shipping_address

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
- belongs_to :delivery_information
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


