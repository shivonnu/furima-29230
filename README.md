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
| name_katakana   | string | null: false |
| birthday        | date   | null: false |


### Association

- has_many   :products
- belongs_to :purchase

## Products テーブル

| column               | Type    | Options                        |
|----------------------|---------|--------------------------------|
| product_name         | string  | null: false                    |
| category             | string  | null: false                    |
| product_description  | integer | null: false                    |
| product_status       | integer | null: false                    |
| price                | integer | null: false                    |
| users_id             | integer | null: false, foreign_key: true |

### Association

- belongs_to :users
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

- belongs_to :products
- belongs_to :shipping_address

## Shipping_address テーブル

| column               | Type    | Options                        |
|----------------------|---------|--------------------------------|
| postal_code          | integer |                                |
| expiration_date      | integer | null: false                    |
| prefectures          | string  | null: false                    |
| city                 | string  | null: false                    |
| address              | string  | null: false                    |
| building_name        | string  | null: false                    |
| phone_number         | integer |                                |
| users_id             | integer | null: false, foreign_key: true |
| products_id          | integer | null: false, foreign_key: true |

### Association

- has_many   :products
- belongs_to :delivery_information
- belongs_to :purchase

## Purchase テーブル

| column               | Type    | Options                        |
|----------------------|---------|--------------------------------|
| credit_card_id       | integer | null: false                    |
| expiation_date_month | integer | null: false                    |
| expiation_date_year  | integer | null: false                    |
| security_code        | integer | null: false                    |
| users_id             | integer | null: false, foreign_key: true |
| products_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :users


