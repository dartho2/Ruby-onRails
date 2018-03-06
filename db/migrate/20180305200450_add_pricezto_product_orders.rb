class AddPriceztoProductOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :product_orders, :price_z, :decimal, :precision => 8, :scale => 2
  end
end
