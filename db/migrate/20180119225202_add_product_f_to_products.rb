class AddProductFToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :product_f, :integer
  end
end
