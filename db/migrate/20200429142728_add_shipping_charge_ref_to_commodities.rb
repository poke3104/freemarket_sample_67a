class AddShippingChargeRefToCommodities < ActiveRecord::Migration[5.2]
  def change
    add_reference :commodities, :shipping_charge, foreign_key: true
  end
end
