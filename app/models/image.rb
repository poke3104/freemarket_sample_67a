class Image < ApplicationRecord
  validates :image, presence: true

  belongs_to :commodity
  mount_uploader :image, ImageUploader
end
