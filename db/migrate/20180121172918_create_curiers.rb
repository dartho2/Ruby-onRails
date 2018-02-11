class CreateCuriers < ActiveRecord::Migration[5.1]
  def change
    create_table :curiers do |t|
      t.string :label
      t.integer :maxweight
      t.integer :minweight
      t.integer :price
      t.timestamps
    end
  end
end
