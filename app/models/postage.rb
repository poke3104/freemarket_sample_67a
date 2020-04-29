class Postage < ApplicationRecord
  validates :price, presence: true

  has_many :commodities
end
