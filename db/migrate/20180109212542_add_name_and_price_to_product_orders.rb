class AddNameAndPriceToProductOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :product_orders, :name, :string
    add_column :product_orders, :price, :decimal, :precision => 8, :scale => 2
  end
end
