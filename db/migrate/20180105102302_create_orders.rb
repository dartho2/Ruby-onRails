class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.string :name
      t.date :sale_date
      t.timestamps
    end
  end
end
