class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commodity, optional: true

  validates :text, :user_id, :commodity_id, presence: true
end
