class Image < ApplicationRecord
  validates :image, presence: true

  belongs_to :commodities
  mount_uploader :image, ImageUploader
end
