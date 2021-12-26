# テーブル設計

## users テーブル

| Column                | Type      | Options       |
| --------------------- | --------- | ------------- |
| name                  | string    | null: false   |
| email                 | string    | null: false   |
| password              | string    | null: false   |
| password-confirmation | string    | null: false   |
| last-name             | string    | null: false   |
| first-name            | string    | null: false   |
| last-name-kana        | string    | null: false   |
| first-name-kana       | string    | null: false   |
| user-birth-date-1i    | string    | null: false   |
| user-birth-date-2i    | string    | null: false   |
| user-birth-date-3i    | string    | null: false   |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column                | Type        | Options                       |
| --------------------- | ----------- | ----------------------------- |
| name                  | text        | null:false                    |
| info                  | text        | null:false                    |
| category              | string      | null:false                    |
| sales-status          | string      | null:false                    |
| shipping-fee-status   | string      | null:false                    |
| prefecture            | string      | null:false                    |
| scheduled-delivery    | string      | null:false                    |
| price                 | integer     | null:false                    |
| user                  | references  | null:false, foreign_key: true |
| order                 | references  | null:false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user
- has_many :comments

## orders テーブル

| Column       | Type          | Options                       |
| ------------ | ------------- | ----------------------------- |
| postal-code  | text          | null:false                    |
| prefecture   | string        | null:false                    |
| city         | string        | null:false                    |
| address      | string        | null:false                    |
| building     | string        | null:false                    |
| phone-number | string        | null:false                    |
| user         | references    | null:false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

