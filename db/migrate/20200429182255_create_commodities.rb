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
      t.references :exhibition_commodity, type: :bigint, null: false, foreign_key: { to_table: :users }
      t.references :purchase_commodity,   type: :bigint, foreign_key: { to_table: :users }
      t.references :sales_status,         type: :bigint, null: false, foreign_key: true, default: 1
      t.references :category,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
