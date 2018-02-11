class AddPriceToMagazine < ActiveRecord::Migration[5.1]
  def change
    add_column :magazines, :price, :integer
  end
end
