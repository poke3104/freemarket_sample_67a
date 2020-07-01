class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :post_number,    null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :town,           null: false
      t.string :building
      t.string :phone_number
      t.references :user,       type: :bigint, null: false, foreign_key: true
      t.timestamps
    end
  end
end
