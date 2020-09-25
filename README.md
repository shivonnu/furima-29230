# テーブル設計

## Users テーブル

| column              | Type   | Options     |
|---------------------|--------|-------------|
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_kana      | string | null: false |
| first_name_kana     | string | null: false |
| birthday            | date   | null: false |


### Association

- has_many   :items
- has_many   :purchases

## Items テーブル

| column                  | Type    | Options                                      |
|-------------------------|---------|----------------------------------------------|
| name                    | string  | null: false                                  |
| description             | text    | null: false                                  |
| category_id             | integer | null: false                                  |
| status_id               | integer | null: false                                  |
| price_id                | integer | null: false                                  |
| shipping_area_id        | integer | null: false                                  |
| shipping_fee_burden_id  | integer | null: false                                  |
| days_to_ship_id         | integer | null: false                                  |
| user_id                 | integer | null: false, foreign_key: :true              |

### Association

- belongs_to :user
- has_one    :purchase

## Shipping_addresses テーブル

| column               | Type    | Options                         |
|----------------------|---------|---------------------------------|
| postal_code          | string  | null: false                     |
| prefectures          | integer | null: false                     |
| city                 | string  | null: false                     |
| address              | string  | null: false                     |
| building_name        | string  |                                 |
| phone_number         | string  | null: false                     |
| purchase_id          | integer | null: false, foreign_key: :true |

### Association

- belongs_to :purchase

## Purchasesテーブル

| column                | Type    | Options                         |
|-----------------------|---------|---------------------------------|
| user_id               | integer | null: false, foreign_key: :true |
| item_id               | integer | null: false, foreign_key: :true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address


