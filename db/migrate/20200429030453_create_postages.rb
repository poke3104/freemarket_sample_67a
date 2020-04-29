class CreatePostages < ActiveRecord::Migration[5.2]
  def change
    create_table :postages do |t|
      t.string :price,         null: false
      t.references :commodity, null: false, foreign_key: true
      t.timestamps
    end
  end
end
