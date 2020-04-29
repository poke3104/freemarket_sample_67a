class CreateClothes < ActiveRecord::Migration[5.2]
  def change
    create_table :clothes do |t|
      t.string :size,          null: false
      t.references :commodity, null: false, foreign_key: true
      t.timestamps
    end
  end
end
