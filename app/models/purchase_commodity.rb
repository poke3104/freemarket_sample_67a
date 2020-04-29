class PurchaseCommodity < ApplicationRecord
  belongs_to :user
  belongs_to :commodity
end
