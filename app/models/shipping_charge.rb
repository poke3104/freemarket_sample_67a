class ShippingCharge < ApplicationRecord
  validates :who, presence: true

  has_many :commoditise
end
