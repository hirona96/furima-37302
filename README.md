# テーブル設計

## users テーブル

| Column                | Type      | Options                    |
| --------------------- | --------- | -------------------------- |
| name                  | string    | null: false                |
| email                 | string    | null: false, unique: true  |
| encrypted_password    | string    | null: false                |
| last-name             | string    | null: false                |
| first-name            | string    | null: false                |
| last-name-kana        | string    | null: false                |
| first-name-kana       | string    | null: false                |
| birthday              | date      | null: false                |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column                 | Type        | Options                       |
| ---------------------- | ----------- | ----------------------------- |
| name                   | string      | null:false                    |
| info                   | text        | null:false                    |
| category_id            | integer     | null:false                    |
| sales-status_id        | integer     | null:false                    |
| shipping-fee-status_id | integer     | null:false                    |
| prefecture_id          | integer     | null:false                    |
| scheduled-delivery_id  | integer     | null:false                    |
| price                  | integer     | null:false                    |
| user                   | references  | null:false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :order

## addresses テーブル

| Column        | Type          | Options                       |
| ------------- | ------------- | ----------------------------- |
| postal-code   | string        | null:false                    |
| prefecture_id | integer       | null:false                    |
| city          | string        | null:false                    |
| address       | string        | null:false                    |
| building      | string        |                               |
| phone-number  | string        | null:false                    |
| order         | references    | null:false, foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Column       | Type          | Options                       |
| ------------ | ------------- | ----------------------------- |
| user         | references    | null:false, foreign_key: true |
| item         | references    | null:false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address
- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

