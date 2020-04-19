# Freemarket_sample_67a DB設計
## userテーブル
|Column|Type|Option|
|------|----|------|
|nick_name|string|null: false,unique:true|
|email|string|null: false|
|password|string|null: false,unique:true|
|exhibition_commodity|string|null:false,foreign_key:true|
|purchase_commodity|string|null: false,foreign_key:true|
|address|string|null: false|

### Association
- has_many :commodities,dependent::delete_all
- has_many :evaluations,dependent::delete_all
- has_many :likes,dependent::delete_all
- belongs_to:profile,dependent::delete
- belongs_to:adress,dependent::delete

## commodityテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|price|string|null: false|
|user|references|null: false,foreign_key:true|
|day_to_ship|string|null:false|
|bland|string|null:false|
|shipping_area|text|null:false|
|shipping_method|text|null:false|

### Association
- has many:categories throuth:commodity_category
- has many:images,dependent::delete_all
- has many:likes,dependent::delete_all
- belongs_to:user
- belongs_to:sales_status
- belongs_to:bland
- belongs_to:clothes size
- belongs_to:postage
- has many:comments,dependent::delete_all

## imageテーブル
|Column|Type|Option|
|------|----|------|
|image|string||
|user|references|null :false,foreign_key:true|
|item|references|null :false,foreign_key:true|
## Association
- belongs_to: commodities

## evaluationテーブル
|Column|Type|Option|
|------|----|------|
|evaluation|string|null:fales|
|user|references|null :false,foreign_key:true|
## Association
- belongs_to: user

## sales statusテーブル
|Column|Type|Option|
|------|----|------|
|status|texit|null:fales|
|commodity|references|null :false,foreign_key:true|
## Association
- has many:commodities

## categoryテーブル
|Column|Type|Option|
|------|----|------|
|name|texit|null:fales|
## Association
- has many:users through:user_commodities

## user_commodityテーブル
|Column|Type|Option|
|------|----|------|
|user|texit|null:fales,foreign_key:true|
|commodity|references|null :false,foreign_key:true|
## Association
- belongs_to: user
- belongs_to: commodity

## blandテーブル
|Column|Type|Option|
|------|----|------|
|name|texit|null:fales|
|commodity|references|null :false,foreign_key:true|
## Association
- has many:commodities

## clothes sizeテーブル
|Column|Type|Option|
|------|----|------|
|size|texit|null:fales|
|commodity|references|null :false,foreign_key:true|
## Association
- has many: commodities

## postageテーブル
|Column|Type|Option|
|------|----|------|
|price|string|null:fales|
|commodity|references|null :false,foreign_key:true|
## Association
- has many:commodities

## likeテーブル
|Column|Type|Option|
|------|----|------|
|user|references|null :false,foreign_key:true|
|commodity|references|null :false,foreign_key:true|
## Association
- belongs_to:commodity
- belongs_to:user

## profileテーブル
|Column|Type|Option|
|------|----|------|
|first_name|text|null:fales|
|last_name|text|null:fales|
|first_name_kana|text|null:fales|
|last_name_kana|text|null:fales|
|phone_number|string|null:fales|
|year_birth_at|string|null:fale|
|month_birth_at|string|null:fales|
|day_birth_at|string|null:fales|
## Association
- belongs_to:user

## commentテーブル
|Column|Type|Option|
|------|----|------|
|commodity|reference|null:fales,foreign_key:true|
|user|reference|nullfales,foreign key:true|
|text|text|null:fales|

## adressテーブル
|Column|Type|Option|
|------|----|------|
|user|string|null:false,foreign_key:true|
|post_number|string|null:false|
|city|text|null:false|
|town|text|null:false|
|building|text||
|prefecture|text|null:false|

## Association
- belongs_to:user