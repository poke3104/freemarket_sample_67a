class CreateSalesStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_statuses do |t|
      t.text :status, null: false
      t.references :commodity, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
