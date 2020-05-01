# Freemarket_sample_67a DB設計
## userテーブル
|Column|Type|Option|
|------|----|------|
|nick_name|string|null: false,unique:true|
|email|string|null: false|
|password|string|null: false,unique:true|
|exhibition_commodity|string|null:false,foreign_key:true|
|purchase_commodity|string|null: false,foreign_key:true|

### Association
- has_many :commodities,dependent::delete_all
- has_many :evaluations,dependent::delete_all
- has_many :likes,dependent::delete_all
- has_many :commodities, through: :likes
- has_many :comments,    dependent: :delete_all
- has_many :commodities, through: :comments
- has_many :exhibition_commodities, dependent: :delete_all
- has_many :commodities, through: :exhibition_commodities
- has_many :purchase_commodities, dependent: :delete_all
- has_many :commodities, through: :purchase_commodities
- has_one :address, dependent: :delete
- has_one :profile, dependent: :delete

## commodityテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null:false|
|price|string|null: false|
|user|references|null: false,foreign_key:true|
|day_to_ship|string|null:false|
|brand|references|null:false,foreighn_key:true|
|shipping_area|text|null:false|
|shipping_method|text|null:false|
|text|text||
|condition|string||
|exhibition_commodity|references|foreign_key:true|
|parchase_commodity|references|foreign_key:true|
|sales_status|references|foreign_key:true|
|postage|references|foreign_key:true|
|clothe|references|foreign_key:true|

### Association
- has many:categories throuth:commodity_category
- has many:images,dependent::delete_all
- has many:likes,dependent::delete_all
- belongs_to:user
- belongs_to:sales_status
- belongs_to:bland
- belongs_to:clothes size
- belongs_to:postage
- has_many:comments,dependent::delete_all

## imageテーブル
|Column|Type|Option|
|------|----|------|
|image|string||
|commodity|references|null :false,foreign_key:true|
## Association
- belongs_to: commodity

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
|status|text|null:fales|
## Association
- has_many:commodities

## categoryテーブル
|Column|Type|Option|
|------|----|------|
|name|text|null:false|
## Association
- has_many:users through:user_commodities

## commodity_categoryテーブル
|Column|Type|Option|
|------|----|------|
|category|text|null:fales,foreign_key:true|
|commodity|references|null :false,foreign_key:true|
## Association
- belongs_to: user
- belongs_to: commodity

## brandテーブル
|Column|Type|Option|
|------|----|------|
|name|text|null:false|
## Association
- has_many:commodities

## clotheテーブル
|Column|Type|Option|
|------|----|------|
|size|text|null:false|
## Association
- belongs_to: commodity

## postageテーブル
|Column|Type|Option|
|------|----|------|
|price|string|null:false|
## Association
- has_many:commodities

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
|first_name|text|null:false|
|last_name|text|null:false|
|first_name_kana|text|null:false|
|last_name_kana|text|null:false|
|phone_number|string|null:false|
|year_birth_at|string|null:false|
|month_birth_at|string|null:false|
|day_birth_at|string|null:false|
|user|references|null:false,foreign_key:true|
## Association
- belongs_to:user

## commentテーブル
|Column|Type|Option|
|------|----|------|
|commodity|reference|null:false,foreign_key:true|
|user|reference|nullfalse,foreign key:true|
|text|text|null:false|
## Association
- belongs_to:commodity
- belongs_to:user

## addressテーブル
|Column|Type|Option|
|------|----|------|
|user|references|null:false,foreign_key:true|
|post_number|string|null:false|
|city|string|null:false|
|town|string|null:false|
|building|string||
|prefecture|string|null:false|

## Association
- belongs_to:user

## shipping_chargeテーブル
|Column|Type|Option|
|------|----|------|
|who|string|null:false|

## Association
- has_many:commodities