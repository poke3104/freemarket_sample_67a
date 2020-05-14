class Image < ApplicationRecord
  validates :image, presence: true

  belongs_to :commodity
end
