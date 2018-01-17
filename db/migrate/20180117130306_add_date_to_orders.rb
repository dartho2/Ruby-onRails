class AddDateToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :datatime, :string
  end
end
