class AddReferencesToProductOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :product_orders, :order, foreign_key: true
    add_reference :product_orders, :product, foreign_key: true
  end
end
