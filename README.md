## Users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| lastname           | text    | null: false               |
| firstname          | text    | null: false               |
| lastname_kana      | text    | null: false               |
| firstname_kana     | text    | null: false               |
| birth_year         | integer | null: false               |
| birth_month        | integer | null: false               |
| birth_day          | integer | null: false               |

## Items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| item_name          | string  | null: false |
| explanation        | text    | null: false |
| category           | boolean | null: false |
| condition          | boolean | null: false |
| delivery_charge    | boolean | null: false |
| prefectures        | boolean | null: false |
| shipping_days      | boolean | null: false |
| price              | string  | null: false |

## Addresses テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| post_code          | string  | null: false |
| prefectures        | boolean | null: false |
| municipalities     | string  | null: false |
| address            | string  | null: false |
| Building_name      | string  |             |
| telephone_number   | string  | null: false |

## Purchases テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false |
| item   | references | null: false |

### Association
UsersTable has_many ItemsTable
UsersTable belongs_to AddressesTable
ItemsTable belongs_to UsersTable
ItemsTable belongs_to PurchasesTable
AddressesTable belongs_to UsersTable
AddressesTable belongs_to PurchasesTable
PurchasesTable belongs_to AddressesTable
PurchasesTable belongs_to ItemsTable