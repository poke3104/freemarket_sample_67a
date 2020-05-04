class TopsController < ApplicationController
  def index
    @commodities = Commodity.all.order(sales_status_id: "DESC", id: "ASC")
    @last_commodities = @commodities.last(3)
  end
end
