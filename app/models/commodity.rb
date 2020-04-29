class Commodity < ApplicationRecord
  validates :name, :price, :day_to_ship, :shipping_area, :shipping_method, presence: true

  belongs_to :user
  belongs_to :brand
  belongs_to :sales_status
  belongs_to :clothe
  belongs_to :postage
  has_many :images, dependent: :delete_all
  has_many :Commodity_categories, dependent: :delete_all
  has_many :categories, through: :Commodity_categories
  has_many :likes, dependent: :delete_all
  has_many :users, through: :likes
  has_many :comments, dependent: :delete_all
  has_many :users, through: :comments
  has_many :exhibition_commodities, dependent: :delete_all
  has_many :users, through: :exhibition_commodities
  has_many :purchase_commodities, dependent: :delete_all
  has_many :users, through: :purchase_commodities
end
