class CommodityCategory < ApplicationRecord
  belongs_to :category
  belongs_to :commodity
end
