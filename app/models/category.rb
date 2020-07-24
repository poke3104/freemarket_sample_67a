class Category < ApplicationRecord
  validates :name, presence: true

  has_many :commodities
  has_ancestry
end
