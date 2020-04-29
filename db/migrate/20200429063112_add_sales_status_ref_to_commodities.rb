class AddSalesStatusRefToCommodities < ActiveRecord::Migration[5.2]
  def change
    add_reference :commodities, :sales_status, foreign_key: true
  end
end
