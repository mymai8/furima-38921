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
UsersTable has_many ItemsTable
UsersTable has_one AddressesTable


## Items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false, foreign_key: true |
| explanation        | text       | null: false, foreign_key: true |
| category           | ActiveHash | null: false, foreign_key: true |
| condition          | ActiveHash | null: false, foreign_key: true |
| delivery_charge    | ActiveHash | null: false, foreign_key: true |
| prefectures        | ActiveHash | null: false, foreign_key: true |
| shipping_days      | ActiveHash | null: false, foreign_key: true |
| price              | string     | null: false, foreign_key: true |

### Association
ItemsTable has_one UsersTable
ItemsTable has_one PurchasesTable


## Addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false, foreign_key: true |
| prefectures        | ActiveHash | null: false, foreign_key: true |
| municipalities     | string     | null: false, foreign_key: true |
| address            | string     | null: false, foreign_key: true |
| Building_name      | string     |foreign_key: true               |
| telephone_number   | string     | null: false, foreign_key: true |

### Association
AddressesTable has_one UsersTable
AddressesTable has_many PurchasesTable


## Purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
PurchasesTable has_one AddressesTable
PurchasesTable has_one ItemsTable