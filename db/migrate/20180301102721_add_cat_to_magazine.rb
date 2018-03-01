class AddCatToMagazine < ActiveRecord::Migration[5.1]
  def change
    add_column :magazines, :cat_buy, :integer
  end
end
