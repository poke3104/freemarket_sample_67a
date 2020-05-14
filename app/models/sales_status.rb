class SalesStatus < ApplicationRecord
  validates :status, presence: true

  has_many :commodities
end
