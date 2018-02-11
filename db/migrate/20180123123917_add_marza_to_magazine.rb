class AddMarzaToMagazine < ActiveRecord::Migration[5.1]
  def change
    add_column :magazines, :marza, :integer
    add_column :curiers, :maxheight, :decimal, :precision => 8, :scale => 2
  end
end
