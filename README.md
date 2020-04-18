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
- has_many :commodities
- has_many :evaluations
- has_many :likes
- belongs_to:profile

## commodityテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|price|string|null: false|
|user|references|null: false,foreign_key:true|

### Association
- has many:categories throuth:commodity_category
- has many:images
- has many:likes
- belongs_to:user
- belongs_to:sales status
- belongs_to:shipping area
- belongs_to:bland
- belongs_to:clothes size
- belongs_to:postage
- has many:comments

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

## shipping areaテーブル
|Column|Type|Option|
|------|----|------|
|area|texit|null:fales|
|commodity|references|null :false,foreign_key:true|
## Association
- has many:comodities

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
|commodity|reference|null:fales,foreign key:true|
|user|reference|nullfales,foreign key:true|
|text|text|null:fales|