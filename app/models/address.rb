class Address < ApplicationRecord
  validates :post_number, :city, :town, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  belongs_to :user
end
