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

## addresses テーブル

| Column       | Type          | Options                       |
| ------------ | ------------- | ----------------------------- |
| postal-code  | text          | null:false                    |
| prefecture   | string        | null:false                    |
| city         | string        | null:false                    |
| address      | string        | null:false                    |
| building     | string        | null:false                    |
| phone-number | string        | null:false                    |

### Association

- belongs_to :order

## orders テーブル

| user         | references    | null:false, foreign_key: true |
| item         | references    | null:false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

