class Commodity < ApplicationRecord
  validates :name, :price, :day_to_ship, :shipping_method, presence: true

  belongs_to :brand, optional: true
  belongs_to :sales_status, optional: true
  belongs_to :postage, optional: true
  has_many :images, dependent: :delete_all
  has_many :commodity_categories, dependent: :delete_all
  has_many :categories, through: :Commodity_categories
  has_many :likes, dependent: :delete_all
  has_many :users, through: :likes
  has_many :comments, dependent: :delete_all
  has_many :users, through: :comments
  belongs_to :exhibition_commodities, class_name: "User", optional: true
  belongs_to :purchase_commodities, class_name: "User", optional: true

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :brand, allow_destroy: true
  # accepts_nested_attributes_for :shipping_charge, allow_destroy: true



end
