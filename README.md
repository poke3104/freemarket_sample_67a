# Freemarket_sample_67a DB設計
## usersテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false,unique:true|
|email|string|null: false|
|password|string|null: false,unique:true|
|birthday|string|null: false|
|phone number|string|null:false,unique:true|
|exhibition_item|string|null:false|
|purchase_item|string|null: false|
|address|string|null: false|

### Association
- has_many :items
- has_many :photos

## itemsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|price|string|null: false|
|user|references|null: false,foreign_key:true|

### Association
- belongs_to :user
- has many:photos

## photosテーブル
|Column|Type|Option|
|------|----|------|
|image|string||
|user|references|null :false,foreign_key:true|
|item|references|null :false,foreign_key:true|
## Association
- belongs_to: user
- belongs_to: item

