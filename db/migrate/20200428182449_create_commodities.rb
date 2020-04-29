class CreateCommodities < ActiveRecord::Migration[5.2]
  def change
    create_table :commodities do |t|
      t.string :name,            null: false
      t.string :price,           null: false
      t.string :shipping_area,   null: false
      t.string :shipping_method, null: false
      t.references :user,        null: false, foreign_key: true
      t.references :brand,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
