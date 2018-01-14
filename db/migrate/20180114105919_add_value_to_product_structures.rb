class AddValueToProductStructures < ActiveRecord::Migration[5.1]
  def change
    add_column :product_structures, :value, :string
  end
end
