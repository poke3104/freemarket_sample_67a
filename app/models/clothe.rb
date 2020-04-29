class Clothe < ApplicationRecord
  validates :size, presence: true

  has_many :commodities
end
