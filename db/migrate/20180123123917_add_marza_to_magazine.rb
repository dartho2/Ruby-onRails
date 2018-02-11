class AddMarzaToMagazine < ActiveRecord::Migration[5.1]
  def change
    add_column :magazines, :marza, :integer
    add_column :curiers, :maxheight, :integer
  end
end
