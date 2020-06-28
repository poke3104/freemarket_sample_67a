class CreateCommodities < ActiveRecord::Migration[5.2]
  def change
    create_table :commodities do |t|
      t.string :name,            null: false
      t.string :price,           null: false
      t.text :text,              null: false
      t.string :clothe
      t.string :brand
      t.string :condition,       null: false
      t.string :day_to_ship,     null: false
      t.string :prefecture_id,   null: false
      t.string :shipping_charge, null: false
      t.integer :shipping_method_id, null: false
      t.bigint :exhibition_commodity_id, null: false, foreign_key: { to_table: :users }
      t.bigint :purchase_commodity_id, foreign_key: { to_table: :users }
      t.bigint :sales_status_id,         null: false, foreign_key: true, default: 0
      t.bigint :category_id,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
