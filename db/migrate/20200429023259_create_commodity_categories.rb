class CreateCommodityCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :commodity_categories do |t|
      t.references :commodity, null: false, forein_key: true
      t.references :category,  null: false, forein_key: true
      t.timestamps
    end
  end
end
