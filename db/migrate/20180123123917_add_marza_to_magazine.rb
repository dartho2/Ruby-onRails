class AddMarzaToMagazine < ActiveRecord::Migration[5.1]
  def change
    add_column :magazines, :marza, :decimal, precision: 5, scale: 2
    add_column :curiers, :maxheight, :decimal, precision: 5, scale: 2
  end
end
