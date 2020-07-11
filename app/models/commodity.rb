class Commodity < ApplicationRecord

  belongs_to :sales_status, optional: true
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :images, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :users, through: :comments
  belongs_to :exhibition_commodities, class_name: "User", optional: true
  belongs_to :purchase_commodities, class_name: "User", optional: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_method

  accepts_nested_attributes_for :images, allow_destroy: true

  enum status: { "出品中": 1, "売却済": 2 }

  validates :images, :category_id, :condition, :shipping_method_id, :shipping_charge, :day_to_ship, :prefecture_id, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, 
                    numericality: { only_integer: true,
                                    greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9999999 }  

end
