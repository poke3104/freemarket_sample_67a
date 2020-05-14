class AddPostageRefToCommodities < ActiveRecord::Migration[5.2]
  def change
    add_reference :commodities, :postage, foreign_key: true
  end
end
