class AddPriceToMagazine < ActiveRecord::Migration[5.1]
  def change
    add_column :magazines, :price, :decimal, :precision => 8, :scale => 2
  end
end
