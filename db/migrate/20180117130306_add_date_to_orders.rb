class AddDateToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :datatime, :date
  end
end
