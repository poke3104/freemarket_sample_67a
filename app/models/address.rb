class Address < ApplicationRecord
  validates :post_number, :prefecture_id, :city, :town, presence: true

  belongs_to :user
  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
