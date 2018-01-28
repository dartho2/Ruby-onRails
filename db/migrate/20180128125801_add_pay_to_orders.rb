class AddPayToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :status, :boolean, default: false
  end
end
