class AddClotheRefToCommodities < ActiveRecord::Migration[5.2]
  def change
    add_reference :commodities, :clothe, foreign_key: true
  end
end
