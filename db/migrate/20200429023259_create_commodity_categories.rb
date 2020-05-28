class CreateCommodityCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :commodity_categories do |t|
      t.references :commodity, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
