## Users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
has_many :items
has_many :orders


## Items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | ActiveHash | null: false                    |
| condition     | ActiveHash | null: false                    |
| shipping_cost | ActiveHash | null: false                    |
| prefecture    | ActiveHash | null: false                    |
| shipping_day  | ActiveHash | null: false                    |
| price         | string     | null: false                    |

### Association
belongs_to :user
has_one :order


## Payments テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| order            | references | null: false, foreign_key: true |
| post_code        | string     | null: false                    |
| prefecture       | ActiveHash | null: false                    |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |

### Association
belongs_to :order


## Orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :payment