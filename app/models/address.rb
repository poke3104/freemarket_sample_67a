class Address < ApplicationRecord
  validates :post_number, :prefecture_id, :city, :town, presence: true
  validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }

  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
