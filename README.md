# Freemarket_sample_67a DB設計
## userテーブル
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
- has_many :commodities

## itemテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|price|string|null: false|
|user|references|null: false,foreign_key:true|

### Association
- belongs_to :user
- has many:photos

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
