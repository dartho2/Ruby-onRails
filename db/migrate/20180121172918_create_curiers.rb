class CreateCuriers < ActiveRecord::Migration[5.1]
  def change
    create_table :curiers do |t|
      t.string :label
      t.integer :maxweight
      t.integer :minweight
      t.decimal :price, precision: 8, scale: 2
      t.timestamps
    end
  end
end
