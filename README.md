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

- has_many   :items
- has_many   :purchases

## Items テーブル

| column               | Type    | Options                        |
|----------------------|---------|--------------------------------|
| name                 | string  | null: false                    |
| description          | text    | null: false                    |
| category             | integer | null: false                    |
| status               | integer | null: false                    |
| price                | integer | null: false                    |
| shipping_area        | integer | null: false                    |
| shipping_fee_burden  | integer | null: false                    |
| days_to_ship         | integer | null: false                    |
| user_id              | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## Shipping_addresses テーブル

| column               | Type    | Options                        |
|----------------------|---------|--------------------------------|
| postal_code          | string  | null: false                    |
| prefectures          | integer | null: false                    |
| city                 | string  | null: false                    |
| address              | string  | null: false                    |
| building_name        | string  |                                |
| phone_number         | string  | null: false                    |

### Association

- belongs_to :purchase

## Purchasesテーブル

| column                | Type    | Options                        |
|-----------------------|---------|--------------------------------|
| user_id               | integer | null: false, foreign_key: true |
| item_id               | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address


