class Address < ApplicationRecord
  validates :post_number, :city, :town, :prefecture, presence: true

  belongs_to :user
end
