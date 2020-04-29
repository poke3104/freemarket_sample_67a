class Evaluation < ApplicationRecord
  validates :evaluation, presence: true

  belongs_to :user
end
