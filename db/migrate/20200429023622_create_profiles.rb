class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name,      null: false
      t.string :last_name,       null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana,  null: false
      t.string :phone_number,    null: false
      t.string :year_birth_at,   null: false
      t.string :month_birth_at,  null: false
      t.string :day_birth_at,    null: false
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
